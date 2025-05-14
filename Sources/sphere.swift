import Foundation

struct Sphere: Hittable {
  var center: Vec3
  var radius: Double

   func hit(ray: Ray) -> Double {
    let oc = center - ray.origin  
    let a = Vec3.dot(v1: ray.direction, v2: ray.direction)
    let b = -2.0 * Vec3.dot(v1: ray.direction, v2: oc)
    let c = Vec3.dot(v1: oc, v2: oc) - self.radius * self.radius
    let discriminant = b * b - 4 * a * c
        if discriminant >= 0 {
            return (-b - sqrt(discriminant) / (2.0*a)) 
        }
        else {
            return -1.0 
        }
  }
}
