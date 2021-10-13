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
    var choice_A_next_state: String
    var choice_B_next_state: String
    // outlets
    let choice_A: UIButton
    let choice_B: UIButton
    
    init(
        state_name: String,
         state_number: Int,
        dialouge_text: String,
        choice_A_text: String,
        choice_B_text: String,
        choice_A_next_State: String,
        choice_B_next_State: String,
        choice_A:UIButton,
        choice_B:UIButton
    ) {
        self.state_name = state_name
        self.state_number = state_number
        self.dialouge_text = dialouge_text
        self.choice_A_text = choice_A_text
        self.choice_B_text = choice_B_text
        self.choice_A_next_state = choice_A_next_State
        self.choice_B_next_state = choice_B_next_State
        self.choice_A = choice_A
        self.choice_B = choice_B
    }
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_A_selected() -> String {
        // choice_A.setTitle(choice_A_text[step], for: .normal)
        // step_dialouge()
        // set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        print("choice a is selected")
        
        return choice_A_next_state
    }
    
    // overridable
    // return value used to set ViewController.current_level
    func choice_B_selected() -> String {
        // choice_B.setTitle(choice_B_text[step], for: .normal)
        // step_dialouge()
        // set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        
        return choice_B_next_state
    }
    
}
