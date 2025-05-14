struct Ray {
    var origin: Vec3
    var direction: Vec3

    func at(_ t: Double) -> Vec3 {
        origin + t * direction
    }
}
