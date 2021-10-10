//
//  ViewController.swift
//  animation
//
//  Created by Brian Liew on 10/6/21.
//

import UIKit
import SpriteKit

let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    // views
    let background_view = UIImageView()
    let control_view = UIView()
    let character_view = UIImageView()
    
    // labels
    let chat = UILabel()
    
    // buttons
    let left_button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let right_button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    // variables
    let my_image = UIImage(named: "40f.png")
        
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        left_button.translatesAutoresizingMaskIntoConstraints = false
        right_button.translatesAutoresizingMaskIntoConstraints = false
        
        background_view.backgroundColor = UIColor.lightGray
        control_view.backgroundColor = UIColor.darkGray
        character_view.backgroundColor = UIColor.systemRed
        chat.backgroundColor = UIColor.black
        left_button.backgroundColor = UIColor.systemRed
        right_button.backgroundColor = UIColor.systemBlue
        
        chat.text = "a wild Pikachu has appeared!"
        chat.textAlignment = NSTextAlignment.center
        chat.textColor = UIColor.white
        
        character_view.contentMode = UIView.ContentMode.scaleAspectFit
        character_view.image = my_image
                        
        view.addSubview(background_view)
        view.addSubview(control_view)
        view.addSubview(character_view)
        view.addSubview(chat)
        view.sendSubviewToBack(character_view)
        view.sendSubviewToBack(background_view)
        control_view.addSubview(left_button)
        control_view.addSubview(right_button)

        NSLayoutConstraint.activate([
            // view constraints
            background_view.widthAnchor.constraint(equalToConstant: screen_width),
            background_view.heightAnchor.constraint(equalToConstant: screen_height / 2),
            control_view.widthAnchor.constraint(equalToConstant: screen_width),
            control_view.heightAnchor.constraint(equalToConstant: screen_height / 2),
            character_view.widthAnchor.constraint(equalToConstant: screen_width),
            character_view.heightAnchor.constraint(equalToConstant: screen_height / 2),

            // button size constraints
            left_button.widthAnchor.constraint(equalToConstant: 100),
            left_button.heightAnchor.constraint(equalToConstant: 200),
            right_button.widthAnchor.constraint(equalToConstant: 100),
            right_button.heightAnchor.constraint(equalToConstant: 200),
            // button position constraints
            left_button.centerYAnchor.constraint(equalTo: control_view.centerYAnchor),
            right_button.centerYAnchor.constraint(equalTo: control_view.centerYAnchor),
            left_button.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: -100),
            right_button.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: 100),
            // chat position constraints
            chat.widthAnchor.constraint(equalToConstant: screen_width),
            chat.heightAnchor.constraint(equalToConstant: screen_height / 6),
            chat.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chat.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        chracter_appears()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        background_view.frame = CGRect(x: 0, y: 0, width: screen_width, height: screen_height * (2 / 3))
        control_view.frame = CGRect(x: 0, y: screen_height * (2 / 3), width: screen_width, height: screen_height * (1 / 3))
        character_view.frame = CGRect(x: screen_width / 2 - 100, y: screen_height / 2 - 300, width: 200, height: 300)
        chat.frame = CGRect(x: 0, y: screen_height / 2, width: screen_width, height: screen_height / 6)
    }
    
    func chracter_appears() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = screen_height / 2 + 150
        animation.toValue = screen_height / 2 - 150
        animation.duration = 2
        
        character_view.layer.add(animation, forKey: "basic")
    }
    
}
