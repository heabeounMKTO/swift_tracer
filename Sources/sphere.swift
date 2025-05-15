import Foundation

struct Sphere: Hittable {
  var center: Vec3
  var radius: Double

  func hit(ray: Ray, t_min: Double, t_max: Double) -> HitRecord? {
    let oc = center - ray.origin
    let a = ray.direction.lengthSquared()
    let h = Vec3.dot(v1: ray.direction, v2: oc)

    let c = Double(oc.lengthSquared()) - self.radius * self.radius
    let discriminant = h * h - a * c

    let sqrtd = sqrt(discriminant)
    var root = (h - sqrtd) / a

    if root <= t_min || t_max <= root {
      root = (h + sqrtd) / a
      if root <= t_min || t_max <= root {
        return nil
      }
    }

    let rec_p = ray.at(root)
    let rec_normal = (rec_p - center) / radius
    let outward_normal = (rec_p - center) / radius
    var record =  HitRecord(p: rec_p, normal: rec_normal, t: root, front_face: false)
        record.determine_normal_face(ray: ray, outward_normal: outward_normal)
        return record
  }
}
