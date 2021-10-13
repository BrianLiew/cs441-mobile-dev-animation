//
//  Level.swift
//  animation
//
//  Created by Brian Liew on 10/10/21.
//

import Foundation
import UIKit

class Level {
    
    // object identifiers
    let name: String
    let number: Int
    // outlets
    let choice_A: UIButton
    let choice_B: UIButton
    let chatbox: UILabel
    // img outlet & value
    var char_view: UIImageView
    var char_img: String
    // states
    var states: [State]
    
    init(
        // object properties
        name: String,
        number: Int,
        // outlets
        choice_A: UIButton,
        choice_B: UIButton,
        chatbox: UILabel,
        // image
        char_view: UIImageView,
        char_img: String,
        // data structs
        states: [State]
    ) {
        self.name = name
        self.number = number
        self.choice_A = choice_A
        self.choice_B = choice_B
        self.chatbox = chatbox
        self.char_view = char_view
        self.char_img = char_img
        self.states = states
                
        char_view.image = UIImage(named: char_img)
    }
    
    // overridable
    func set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "position.y"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        a_view.layer.add(animation, forKey: "basic")
    }
    
}
