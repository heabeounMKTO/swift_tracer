struct Camera {
    var image_width: Int
    var image_height: Int 
    var aspect_ratio: Double
    var viewport_height: Double
    var focal_length: Double
    var viewport_width: Double 
    var camera_center: Vec3
    var viewport_u: Vec3 
    var viewport_v: Vec3
    var pixel_delta_u: Vec3
    var pixel_delta_v: Vec3
    var viewport_upper_left: Vec3
    var pixel00_loc: Vec3

    init( image_width: Int ,  image_height: Int,  camera_center: Vec3,  viewport_height: Double,  focal_length: Double) {
        self.image_width = image_width
        self.image_height = image_height
        self.aspect_ratio = Double(image_width) / Double(image_height)
        self.viewport_height = viewport_height
        self.focal_length = focal_length
        self.viewport_width = viewport_height * (Double(image_width) / Double(image_height))
        self.camera_center =  camera_center
        self.viewport_u = Vec3(viewport_width, 0 , 0)
        self.viewport_v = Vec3(0, -viewport_height,0)
        self.pixel_delta_u = viewport_u / Double(image_width)
        self.pixel_delta_v = viewport_v / Double(image_height)
        self.viewport_upper_left = camera_center - Vec3(0,0, focal_length) - viewport_u/2 - viewport_v/2 
        self.pixel00_loc =  viewport_upper_left + 0.5 * (pixel_delta_u + pixel_delta_v)
    }
}
