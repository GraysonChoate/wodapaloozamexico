import Foundation
import Vision
import CoreImage
import AppKit

// Per-frame person segmentation using the OS's own Vision framework.
// Reads PNGs from a directory, writes an 8-bit matte per frame. Local, no model download.
let args = CommandLine.arguments
guard args.count >= 3 else { print("usage: seg <inDir> <outDir>"); exit(1) }
let inDir = args[1], outDir = args[2]
let fm = FileManager.default
try? fm.createDirectory(atPath: outDir, withIntermediateDirectories: true)
let files = (try! fm.contentsOfDirectory(atPath: inDir)).filter { $0.hasSuffix(".png") }.sorted()
let ctx = CIContext()
var done = 0
for f in files {
    let url = URL(fileURLWithPath: inDir).appendingPathComponent(f)
    guard let img = CIImage(contentsOf: url) else { continue }
    let req = VNGeneratePersonSegmentationRequest()
    req.qualityLevel = .accurate
    req.outputPixelFormat = kCVPixelFormatType_OneComponent8
    let handler = VNImageRequestHandler(ciImage: img, options: [:])
    do { try handler.perform([req]) } catch { continue }
    guard let buf = (req.results?.first)?.pixelBuffer else { continue }
    var mask = CIImage(cvPixelBuffer: buf)
    // Vision returns the matte at its own resolution; scale it back to the frame.
    let sx = img.extent.width  / mask.extent.width
    let sy = img.extent.height / mask.extent.height
    mask = mask.transformed(by: CGAffineTransform(scaleX: sx, y: sy))
    let out = URL(fileURLWithPath: outDir).appendingPathComponent(f)
    guard let cg = ctx.createCGImage(mask, from: img.extent) else { continue }
    let rep = NSBitmapImageRep(cgImage: cg)
    if let data = rep.representation(using: .png, properties: [:]) { try? data.write(to: out) }
    done += 1
}
print("mattes written: \(done) / \(files.count)")
