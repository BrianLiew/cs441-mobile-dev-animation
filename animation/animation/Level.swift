//
//  Level.swift
//  animation
//
//  Created by Brian Liew on 10/10/21.
//

import Foundation
import UIKit

class Level {
    
    let name: String
    let number: Int
    
    let a_choice_A: UIButton
    let a_choice_B: UIButton
    let a_chatbox: UILabel
    
    let a_char_view: UIImageView
    let a_char_img: String
    
    let dialouge: [String]
    let choice_A_text: [String]
    let choice_B_text: [String]
    
    var step: Int = 0
    
    init(name: String,
         number: Int,
         a_choice_A: UIButton,
         a_choice_B: UIButton,
         a_chatbox: UILabel,
         a_char_view: UIImageView,
         a_char_img: String,
         dialouge: [String],
         choice_A_text: [String],
         choice_B_text: [String]
    ) {
        self.name = name
        self.number = number
        self.a_choice_A = a_choice_A
        self.a_choice_B = a_choice_B
        self.a_chatbox = a_chatbox
        self.a_char_view = a_char_view
        self.a_char_img = a_char_img
        self.dialouge = dialouge
        self.choice_A_text = choice_A_text
        self.choice_B_text = choice_B_text
        
        a_char_view.image = UIImage(named: "a_char_img")
    }
    
    func set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "position.y"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        a_view.layer.add(animation, forKey: "basic")
    }
    
    func step_dialouge(_ sender: UIButton) {
        a_choice_A.setTitle(choice_A_text[step], for: .normal)
        a_choice_A.setTitle(choice_B_text[step], for: .normal)
        a_chatbox.text = dialouge[step]
        
        step += 1
    }
    
}
