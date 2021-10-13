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
    var state_name: String
    var state_number: Int
    // state properties
    var dialouge_text: String
    var choice_A_text: String
    var choice_B_text: String
    var choice_A_next_state: State?
    var choice_B_next_state: State?
    var next_level: Level?
    
    init(
        state_name: String,
        state_number: Int,
        dialouge_text: String,
        choice_A_text: String,
        choice_B_text: String,
        choice_A_next_state: State?,
        choice_B_next_state: State?,
        next_level: Level?
    ) {
        self.state_name = state_name
        self.state_number = state_number
        self.dialouge_text = dialouge_text
        self.choice_A_text = choice_A_text
        self.choice_B_text = choice_B_text
        
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
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_A_selected() -> (a_next_level: Level?, a_choice_A_next_state: State?) {
        var a_choice_A_next_state: State? = nil
        var a_next_level: Level? = nil
        // step_dialouge()
        // set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        
        if let choice_A_next_state_unwrapped = choice_A_next_state {
            a_choice_A_next_state = choice_A_next_state_unwrapped
        }
        if let next_level_unwrapped = next_level {
            a_next_level = next_level_unwrapped
        }
        
        /*
        // VERIFICATION
        print("choice_A_selected() called")
        print("choice_A_selected() return value = \(a_next_level?.name) & \(a_choice_A_next_state?.state_name)")
         */
        
        return(a_next_level, a_choice_A_next_state)
    }
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_B_selected() -> (a_next_level: Level?, a_choice_B_next_state: State?) {
        var a_choice_B_next_state: State? = nil
        var a_next_level: Level? = nil
        // step_dialouge()
        // set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        
        if let choice_B_next_state_unwrapped = choice_B_next_state {
            a_choice_B_next_state = choice_B_next_state_unwrapped
        }
        if let next_level_unwrapped = next_level {
            a_next_level = next_level_unwrapped
        }
        
        /*
        // VERIFICATION
        print("choice_B_selected() called")
        print("choice_B_selected() return value = \(a_next_level?.name) & \(a_choice_B_next_state?.state_name)")
         */
        
        return(a_next_level, a_choice_B_next_state)
    }
    
}
