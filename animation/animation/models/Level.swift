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
    // properties
    var char_img: String
    var states: [State]
    
    init(
        // object properties
        name: String,
        number: Int,
        // properties
        char_img: String,
        states: [State]
    ) {
        self.name = name
        self.number = number
        self.char_img = char_img
        self.states = states                
    }
    
    func get_state(number: Int) -> State? {
        for state in states { if number == state.state_number { return state } }
        return nil
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
