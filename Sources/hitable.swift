struct HitRecord {
  var p: Vec3
  var normal: Vec3
  var t: Double 
  var front_face: Bool
  
    mutating func determine_normal_face(ray: Ray, outward_normal: Vec3) {
        front_face = Vec3.dot(v1: ray.direction, v2: outward_normal) < 0
        if front_face == true {
            normal = outward_normal
        } else {
            normal = outward_normal * Vec3(-1,-1,-1)
        }
    }
}

protocol Hittable {
  func hit(ray: Ray, t_min: Double, t_max: Double) -> HitRecord?
}
