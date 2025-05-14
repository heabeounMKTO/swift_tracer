import Foundation

let IMG_WIDTH = 256
let IMG_HEIGHT = 256
let ASPECT_RATIO = IMG_WIDTH / IMG_HEIGHT
let VIEWPORT_HEIGHT = 2.0
let FOCAL_LENGTH = 1.0
let VIEWPORT_WIDTH = VIEWPORT_HEIGHT * (Double(IMG_WIDTH)/Double(IMG_HEIGHT))
let CAMERA_CENTER = Vec3( 0,  0,  0)

let VIEWPORT_U = Vec3( VIEWPORT_WIDTH,  0,  0)
let VIEWPORT_V = Vec3( 0, -VIEWPORT_HEIGHT,  0)

let PIXEL_DELTA_U = VIEWPORT_U / Double(IMG_WIDTH)
let PIXEL_DELTA_V = VIEWPORT_V / Double(IMG_HEIGHT)

let VIEWPORT_UPPER_LEFT = CAMERA_CENTER - Vec3(0, 0,  FOCAL_LENGTH) - VIEWPORT_U/2 - VIEWPORT_V/2
let PIXEL00_LOC = VIEWPORT_UPPER_LEFT + 0.5 * (PIXEL_DELTA_U + PIXEL_DELTA_V)

print("P3\n\(IMG_WIDTH) \(IMG_HEIGHT)\n255")


for j in 0..<IMG_HEIGHT {
    for i in 0..<IMG_WIDTH {
        let PIXEL_CENTER = PIXEL00_LOC + Double(i) * PIXEL_DELTA_U + Double(j) * PIXEL_DELTA_V
        let ray_dir = PIXEL_CENTER - CAMERA_CENTER
        let r =  Ray(origin: CAMERA_CENTER, direction: ray_dir)
        let rgb = Color.ray_color(r: r)
        // print(Color(from: Vec3(1,1,0)))
        print("\(rgb.r) \(rgb.g) \(rgb.b)")
    }
}
