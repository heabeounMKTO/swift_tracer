import Foundation

struct Vec3 {
  var x: Double, y: Double, z: Double
  init(_ x: Double, _ y: Double, _ z: Double) {
    self.x = x
    self.y = y
    self.z = z
  }
  init(from a: Int) {
    self.x = Double(a)
    self.y = Double(a)
    self.z = Double(a)
  }

  init(from a: Double) {
    self.x = Double(a)
    self.y = Double(a)
    self.z = Double(a)
  }
  var description: String {
    return "Vec3(\(x), \(y), \(z))"
  }
  static func + (a: Vec3, b: Vec3) -> Vec3 {
    Vec3(a.x + b.x, a.y + b.y, a.z + b.z)
  }

  static func - (a: Vec3, b: Vec3) -> Vec3 {
    Vec3(a.x - b.x, a.y - b.y, a.z - b.z)
  }

  static func * (a: Vec3, b: Vec3) -> Vec3 {
    Vec3(a.x * b.x, a.y * b.y, a.z * b.z)
  }

  static func * (lhs: Vec3, rhs: Double) -> Vec3 {
    return Vec3(lhs.x * rhs, lhs.y * rhs, lhs.z * rhs)
  }

  static func * (lhs: Double, rhs: Vec3) -> Vec3 {
    return rhs * lhs
  }

  static func / (v: Vec3, t: Double) -> Vec3 {
    (1 / t) * v
  }

  func length() -> Double {
    sqrt(lengthSquared())
  }

  func lengthSquared() -> Double {
    x * x + y * y + z * z
  }

  static func dot(v1: Vec3, v2: Vec3) -> Double {
    return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
  }

  func normalized() -> Vec3 {
    self / length()
  }

  static func random() -> Vec3 {
    Vec3(Double.random(in: 0..<1), Double.random(in: 0..<1), Double.random(in: 0..<1))
  }
}
