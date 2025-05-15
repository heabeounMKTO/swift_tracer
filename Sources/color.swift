struct Color {
  var r: Int, g: Int, b: Int

  init(from pixel_color: Vec3) {
    self.r = Int(255.999 * clamp(pixel_color.x, min: 0.0, max: 1.0))
    self.g = Int(255.999 * clamp(pixel_color.y, min: 0.0, max: 1.0))
    self.b = Int(255.999 * clamp(pixel_color.z, min: 0.0, max: 1.0))
  }

  static func ray_color(r: Ray, world: HitableList) -> Color {
    let t = object.hit(ray: r)
    if let hit_record = world.hit(r, 0.01, INFINITY) {
            let _col = 0.5 * ( hit_record.normal + Vec3(1,1,1))
            return Color(_col)
        }


    if t > 0.0 {
      var N = r.at(t) - Vec3(0, 0, -1)
      N = (N / N.length()) + Vec3(1, 1, 1)
      return Color(from: 0.5 * N)
    }

    let unit_dir: Vec3 = r.direction / r.direction.length()
    let a = 0.5 * (unit_dir.y + 1.0)
    let final_color: Vec3 = (1.0 - a) * Vec3(1.0, 1.0, 1.0) + a * Vec3(0.5, 0.7, 1.0)
    return Color(from: final_color)
  }
}

func clamp(_ x: Double, min minVal: Double, max maxVal: Double) -> Double {
  if x < minVal { return minVal }
  if x > maxVal { return maxVal }
  return x
}
