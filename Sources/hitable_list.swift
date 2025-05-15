import Foundation

struct HitableList: Hittable {
    var objects: [Hittable]
   func hit(ray: Ray, t_min: Double, t_max: Double) -> HitRecord? {
        var closestSoFar =  t_max 
        var hitRecord: HitRecord? = nil
        for object in objects {
            if let tempRec = object.hit(ray: ray, t_min: t_min, t_max: closestSoFar) {
                closestSoFar = tempRec.t
                hitRecord = tempRec
            }
        }
        return hitRecord
    } 
} 
