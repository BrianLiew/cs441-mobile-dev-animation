import UIKit

let image_view = UIImageView()

let image = UIImage(named: "40f.png")

image_view.frame.size.width = 200
image_view.frame.size.height = 300

image_view.center = view.center

image_view.image = image

view.addSubview(image_view)
