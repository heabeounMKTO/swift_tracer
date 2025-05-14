import Foundation

let camera: Camera = Camera(
  image_width: 256,
  image_height: 256, 
  camera_center: Vec3(0, 0, 0), 
    viewport_height: 2.0,
  focal_length: 1.0)

print("P3\n\(camera.image_width) \(camera.image_height)\n255")


let DUMMY_SPHERE = Sphere(center: Vec3(0.0, 0.0, -1.0), radius: 0.5)

for j in 0..<camera.image_height {
  for i in 0..<camera.image_width {
    let PIXEL_CENTER =
      camera.pixel00_loc + Double(i) * camera.pixel_delta_u + Double(j) * camera.pixel_delta_v
    let ray_dir = PIXEL_CENTER - camera.camera_center
    let r = Ray(origin: camera.camera_center, direction: ray_dir)
    let rgb = Color.ray_color(r: r, object: DUMMY_SPHERE)
    print("\(rgb.r) \(rgb.g) \(rgb.b)")
  }
}
