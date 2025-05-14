struct Sphere: Hittable {
    var center: Vec3
    var radius: Double
    
    func hit(ray: Ray, t_min: Double, t_max: Double) -> HitRecord?
    {
       return nil 
    }
}
