//
//  State.swift
//  animation
//
//  Created by Brian Liew on 10/13/21.
//

import Foundation
import UIKit

class State {
    
    // state identifiers
    var name: String
    var number: Double
    // state properties
    var dialouge_text: String
    var choice_A_text: String
    var choice_B_text: String
    var choice_A_next_state: State?
    var choice_B_next_state: State?
    var next_level: Level?
    // animation properties
    var animation_type: animations
    
    init(
        name: String,
        number: Double,
        dialouge_text: String,
        choice_A_text: String,
        choice_B_text: String,
        choice_A_next_state: State?,
        choice_B_next_state: State?,
        next_level: Level?,
        animation_type: animations
    ) {
        self.name = name
        self.number = number
        self.dialouge_text = dialouge_text
        self.choice_A_text = choice_A_text
        self.choice_B_text = choice_B_text
        self.animation_type = animation_type
        
        if let choice_A_next_state_unwrapped = choice_A_next_state {
            self.choice_A_next_state = choice_A_next_state_unwrapped
        }
        if let choice_B_next_state_unwrapped = choice_B_next_state {
            self.choice_B_next_state = choice_B_next_state_unwrapped
        }
        if let next_level_unwrapped = next_level {
            self.next_level = next_level_unwrapped
        }
    }
    
    // animations
    func play_animation(a_view: UIView) {
        switch (animation_type) {
        case animations.appear:
            let animation = CABasicAnimation()

            animation.keyPath = "position.y"
            animation.fromValue = a_view.layer.position.y
            animation.toValue = screen_height / 2 - screen_width / 2
            animation.duration = 2
            
            a_view.layer.add(animation, forKey: "basic")
            
            a_view.layer.position = CGPoint(x: screen_width / 2, y: screen_height / 2 - screen_width / 2)
        case animations.disappear:
            let animation = CABasicAnimation()

            animation.keyPath = "position.y"
            animation.fromValue = a_view.layer.position.y
            animation.toValue = screen_height / 2 + screen_width / 2
            animation.duration = 2
            
            a_view.layer.add(animation, forKey: "basic")
            
            a_view.layer.position = CGPoint(x: screen_width / 2, y: screen_height / 2 + screen_width / 2)
        case animations.angered:
            let animation = CABasicAnimation()

            animation.keyPath = "transform.scale"
            animation.fromValue = 1
            animation.toValue = 1.25
            animation.duration = 0.5
            
            a_view.layer.add(animation, forKey: "basic")
            
            animation.fromValue = 1.25
            animation.toValue = 1
            animation.duration = 0.5
            
            a_view.layer.add(animation, forKey: "basic")
        case animations.dazed:
            let animation = CAKeyframeAnimation()
            
            animation.keyPath = "position.x"
            animation.values = [0, 10, -10, 10, 0]
            animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
            animation.duration = 0.5
            animation.isAdditive = true
            
            a_view.layer.add(animation, forKey: "shake")
        case animations.dazed_and_defeated:
            let animation = CAKeyframeAnimation()
            
            animation.keyPath = "position.x"
            animation.values = [0, 10, -10, 10, 0]
            animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
            animation.duration = 0.5
            animation.isAdditive = true
            
            a_view.layer.add(animation, forKey: "shake")
            
            let animation_2 = CABasicAnimation()

            animation_2.keyPath = "position.y"
            animation_2.fromValue = a_view.layer.position.y
            animation_2.toValue = screen_height / 2 + screen_width / 2
            animation_2.duration = 2
            
            a_view.layer.add(animation_2, forKey: "basic")
            
            a_view.layer.position = CGPoint(x: screen_width / 2, y: screen_height / 2 + screen_width / 2)
        default:
            print("none execution placeholder")
        }
    }
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_A_selected(animation_view: UIView) -> (a_next_level: Level?, a_choice_A_next_state: State?) {
        var a_choice_A_next_state: State? = nil
        var a_next_level: Level? = nil
        
        if let choice_A_next_state_unwrapped = choice_A_next_state {
            a_choice_A_next_state = choice_A_next_state_unwrapped
        }
        if let next_level_unwrapped = next_level {
            a_next_level = next_level_unwrapped
        }
                
        return(a_next_level, a_choice_A_next_state)
    }
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_B_selected(animation_view: UIView) -> (a_next_level: Level?, a_choice_B_next_state: State?) {
        var a_choice_B_next_state: State? = nil
        var a_next_level: Level? = nil
        
        if let choice_B_next_state_unwrapped = choice_B_next_state {
            a_choice_B_next_state = choice_B_next_state_unwrapped
        }
        if let next_level_unwrapped = next_level {
            a_next_level = next_level_unwrapped
        }
        
        return(a_next_level, a_choice_B_next_state)
    }
    
}
