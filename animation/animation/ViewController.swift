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
    let background_view = UIView()
    let control_view = UIView()
    let character_view = character_uiview()
    let chat_view = UIView()
    
    // buttons
    let left_button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let right_button = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        left_button.translatesAutoresizingMaskIntoConstraints = false
        right_button.translatesAutoresizingMaskIntoConstraints = false
        
        background_view.backgroundColor = UIColor.lightGray
        control_view.backgroundColor = UIColor.darkGray
        chat_view.backgroundColor = UIColor.black
        left_button.backgroundColor = UIColor.systemRed
        right_button.backgroundColor = UIColor.systemBlue
        
        view.addSubview(background_view)
        view.addSubview(control_view)
        view.addSubview(character_view)
        view.addSubview(chat_view)
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
            chat_view.widthAnchor.constraint(equalToConstant: screen_width),
            chat_view.heightAnchor.constraint(equalToConstant: screen_height / 6),
            // button size constraints
            left_button.widthAnchor.constraint(equalToConstant: 100),
            left_button.heightAnchor.constraint(equalToConstant: 200),
            right_button.widthAnchor.constraint(equalToConstant: 100),
            right_button.heightAnchor.constraint(equalToConstant: 200),
            // button position constraints
            left_button.centerYAnchor.constraint(equalTo: control_view.centerYAnchor),
            right_button.centerYAnchor.constraint(equalTo: control_view.centerYAnchor),
            left_button.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: -100),
            right_button.centerXAnchor.constraint(greaterThanOrEqualTo: view.centerXAnchor, constant: 100)
        ])
        
        animate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        background_view.frame = CGRect(x: 0, y: 0, width: screen_width, height: screen_height * (2 / 3))
        control_view.frame = CGRect(x: 0, y: screen_height * (2 / 3), width: screen_width, height: screen_height * (1 / 3))
        character_view.frame = CGRect(x: screen_width / 2 - 100, y: screen_height / 2 - 300, width: 200, height: 300)
        chat_view.frame = CGRect(x: 0, y: screen_height / 2, width: screen_width, height: screen_height / 6)
    }
    
    func animate() {
        let animation = CABasicAnimation()
        animation.keyPath = "position.y"
        animation.fromValue = 500
        animation.toValue = 180
        animation.duration = 10
        
        character_view.layer.add(animation, forKey: "basic")
    }
    
}

class character_uiview: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
                
        let rect_1 = CGRect(x: screen_width / 2 - 100, y: screen_height / 2 - 300, width: 200, height: 300)
        
        context.setFillColor(UIColor.systemRed.cgColor)
        context.addRect(rect_1)
        context.drawPath(using: .fillStroke)
    }
    
}

