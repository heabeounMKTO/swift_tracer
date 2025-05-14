import Foundation

struct Vec3 {
    var x: Double, y: Double, z: Double

    static func +(a: Vec3, b: Vec3) -> Vec3 {
        Vec3(x: a.x + b.x, y: a.y + b.y, z: b.z + b.z)
    }

    static func -(a: Vec3, b: Vec3) -> Vec3 {
        Vec3(x: a.x - b.x, y: a.y - b.y, z: b.z - b.z)
    }

    static func *(a: Vec3, b: Vec3) -> Vec3 {
        Vec3(x: a.x * b.x, y: a.y * b.y, z: b.z * b.z)
    }
    
    // multiply with a scalar
    static func *(t: Double, v: Vec3) -> Vec3 {
        Vec3(x: t * v.x, y: t * v.y, z: t * v.z)
    }

    static func /(v: Vec3, t: Double) -> Vec3 {
        (1 / t) * v
    }

        func length() -> Double {
        sqrt(lengthSquared())
    }

    func lengthSquared() -> Double {
        x * x + y * y + z * z
    }

    func dot(_ v: Vec3) -> Double {
        x * v.x + y * v.y + z * v.z
    }

    func normalized() -> Vec3 {
        self / length()
    }

    static func random() -> Vec3 {
        Vec3(x: Double.random(in: 0..<1), y: Double.random(in: 0..<1), z: Double.random(in: 0..<1))
    }
}
