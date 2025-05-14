import Foundation

let IMG_WIDTH = 256
let IMG_HEIGHT = 256

print("P3\n\(IMG_WIDTH) \(IMG_HEIGHT)\n255")


for j in 0..<IMG_HEIGHT {
    for i in 0..<IMG_WIDTH {
        let r = Double(i) / Double(IMG_WIDTH - 1)
        let g = Double(j) / Double(IMG_HEIGHT - 1)
        let b = 0.0

        let ir = Int(255.999 * r)
        let ig = Int(255.999 * g)
        let ib = Int(255.999 * b)

        print("\(ir) \(ig) \(ib)")
    }
}
