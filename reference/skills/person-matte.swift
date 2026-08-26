import Foundation
import Vision
import CoreImage
import AppKit

// Per-frame person mattes from the OS's own Vision framework. Local; no model download.
//
// Instances are filtered BY SIZE, which is a depth cue in a shot like this: the people in the
// stands and the subject in front of the camera are large, and the competitors out on the floor
// are small and far away. Keeping only the large ones puts the near people in front of the type
// and lets it pass in front of the distant floor.
//
//   seg <inDir> <outDir> [minAreaFraction]
let args = CommandLine.arguments
guard args.count >= 3 else { print("usage: seg <inDir> <outDir> [minAreaFraction]"); exit(1) }
let inDir = args[1], outDir = args[2]
let minArea = args.count > 3 ? (Double(args[3]) ?? 0.008) : 0.008
let fm = FileManager.default
try? fm.createDirectory(atPath: outDir, withIntermediateDirectories: true)
let files = (try! fm.contentsOfDirectory(atPath: inDir)).filter { $0.hasSuffix(".png") }.sorted()
let ctx = CIContext()
var done = 0, kept = 0, dropped = 0

func coverage(_ buf: CVPixelBuffer) -> Double {
    CVPixelBufferLockBaseAddress(buf, .readOnly)
    defer { CVPixelBufferUnlockBaseAddress(buf, .readOnly) }
    guard let base = CVPixelBufferGetBaseAddress(buf) else { return 0 }
    let w = CVPixelBufferGetWidth(buf), h = CVPixelBufferGetHeight(buf)
    let stride = CVPixelBufferGetBytesPerRow(buf)
    let p = base.assumingMemoryBound(to: UInt8.self)
    var on = 0, total = 0
    for y in Swift.stride(from: 0, to: h, by: 3) {
        for x in Swift.stride(from: 0, to: w, by: 3) {
            total += 1
            if p[y * stride + x] > 128 { on += 1 }
        }
    }
    return total > 0 ? Double(on) / Double(total) : 0
}

for f in files {
    let url = URL(fileURLWithPath: inDir).appendingPathComponent(f)
    guard let img = CIImage(contentsOf: url) else { continue }
    let out = URL(fileURLWithPath: outDir).appendingPathComponent(f)
    let handler = VNImageRequestHandler(ciImage: img, options: [:])
    var acc: CIImage? = nil

    if #available(macOS 14.0, *) {
        let req = VNGeneratePersonInstanceMaskRequest()
        if (try? handler.perform([req])) != nil, let obs = req.results?.first {
            for inst in obs.allInstances {
                guard let buf = try? obs.generateScaledMaskForImage(forInstances: [inst],
                                                                   from: handler) else { continue }
                if coverage(buf) < minArea { dropped += 1; continue }
                kept += 1
                var m = CIImage(cvPixelBuffer: buf)
                m = m.transformed(by: CGAffineTransform(scaleX: img.extent.width / m.extent.width,
                                                        y: img.extent.height / m.extent.height))
                // union: lighten keeps the brighter of the two, which is what a union of mattes is
                acc = acc == nil ? m : m.applyingFilter("CILightenBlendMode",
                                                        parameters: [kCIInputBackgroundImageKey: acc!])
            }
        }
    }
    // The instance request caps out at a handful of people and silently drops the rest — which
    // in a crowd leaves the spectators behind the subject unmasked. The single-person request
    // returns ONE combined mask for everybody it can see, so it covers the mid-ground rows the
    // instance request abandons. Neither alone is enough; the union is.
    let seg = VNGeneratePersonSegmentationRequest()
    seg.qualityLevel = .accurate
    seg.outputPixelFormat = kCVPixelFormatType_OneComponent8
    if (try? handler.perform([seg])) != nil, let buf = (seg.results?.first)?.pixelBuffer {
        var m = CIImage(cvPixelBuffer: buf)
        m = m.transformed(by: CGAffineTransform(scaleX: img.extent.width / m.extent.width,
                                                y: img.extent.height / m.extent.height))
        acc = acc == nil ? m : m.applyingFilter("CILightenBlendMode",
                                                parameters: [kCIInputBackgroundImageKey: acc!])
    }

    let black = CIImage(color: .black).cropped(to: img.extent)
    let final = (acc ?? black).cropped(to: img.extent)
    if let cg = ctx.createCGImage(final, from: img.extent) {
        let rep = NSBitmapImageRep(cgImage: cg)
        if let d = rep.representation(using: .png, properties: [:]) { try? d.write(to: out) }
        done += 1
    }
}
print("mattes \(done)/\(files.count)   instances kept \(kept)  dropped as too far \(dropped)  (min area \(minArea))")
