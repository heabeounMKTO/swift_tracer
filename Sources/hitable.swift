struct HitRecord {
    var p: Vec3
    var normal: Vec3
    var t: Double
}

protocol Hittable {
    func hit(ray: Ray, t_min: Double, t_max: Double) -> HitRecord?
}
