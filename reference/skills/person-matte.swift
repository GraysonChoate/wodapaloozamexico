import Foundation
import Vision
import CoreImage
import AppKit

// Per-frame person mattes from the OS's own Vision framework. Local; no model download.
// Tries the multi-person instance request first (macOS 14+) and unions every instance it
// finds — the single-person request only reliably returns the dominant figure, which in a
// crowd leaves everyone else unmasked. Falls back to the single-person request.
let args = CommandLine.arguments
guard args.count >= 3 else { print("usage: seg <inDir> <outDir>"); exit(1) }
let inDir = args[1], outDir = args[2]
let fm = FileManager.default
try? fm.createDirectory(atPath: outDir, withIntermediateDirectories: true)
let files = (try! fm.contentsOfDirectory(atPath: inDir)).filter { $0.hasSuffix(".png") }.sorted()
let ctx = CIContext()
var done = 0, viaInstances = 0

func write(_ mask: CIImage, extent: CGRect, to url: URL) {
    guard let cg = ctx.createCGImage(mask, from: extent) else { return }
    let rep = NSBitmapImageRep(cgImage: cg)
    if let d = rep.representation(using: .png, properties: [:]) { try? d.write(to: url) }
}

for f in files {
    let url = URL(fileURLWithPath: inDir).appendingPathComponent(f)
    guard let img = CIImage(contentsOf: url) else { continue }
    let out = URL(fileURLWithPath: outDir).appendingPathComponent(f)
    let handler = VNImageRequestHandler(ciImage: img, options: [:])
    var wrote = false

    if #available(macOS 14.0, *) {
        let req = VNGeneratePersonInstanceMaskRequest()
        if (try? handler.perform([req])) != nil,
           let obs = req.results?.first, !obs.allInstances.isEmpty {
            // every instance at once, which is the union of all the people it found
            if let buf = try? obs.generateScaledMaskForImage(forInstances: obs.allInstances,
                                                             from: handler) {
                var m = CIImage(cvPixelBuffer: buf)
                m = m.transformed(by: CGAffineTransform(scaleX: img.extent.width / m.extent.width,
                                                        y: img.extent.height / m.extent.height))
                write(m, extent: img.extent, to: out)
                wrote = true; viaInstances += 1
            }
        }
    }
    if !wrote {
        let req = VNGeneratePersonSegmentationRequest()
        req.qualityLevel = .accurate
        req.outputPixelFormat = kCVPixelFormatType_OneComponent8
        guard (try? handler.perform([req])) != nil,
              let buf = (req.results?.first)?.pixelBuffer else { continue }
        var m = CIImage(cvPixelBuffer: buf)
        m = m.transformed(by: CGAffineTransform(scaleX: img.extent.width / m.extent.width,
                                                y: img.extent.height / m.extent.height))
        write(m, extent: img.extent, to: out)
    }
    done += 1
}
print("mattes: \(done)/\(files.count)   via instance masks: \(viaInstances)")
