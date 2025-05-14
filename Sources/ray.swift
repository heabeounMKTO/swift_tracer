struct Ray {
    var origin: Vec3
    var direction: Vec3

    var description: String {
        return "Ray(origin: \(origin), direction: \(direction))"
    }
    func at(_ t: Double) -> Vec3 {
        origin + t * direction
    }
}
