//
//  Levels.swift
//  animation
//
//  Created by Brian Liew on 10/13/21.
//

import Foundation
import UIKit

// singleton class
class Levels {
    
    let choice_A: UIButton
    let choice_B: UIButton
    let chatbox: UILabel
    // image
    let char_view: UIImageView
    
    
    init(choice_A: UIButton, choice_B: UIButton, chatbox: UILabel, char_view: UIImageView) {
        self.choice_A = choice_A
        self.choice_B = choice_B
        self.chatbox = chatbox
        self.char_view = char_view
        all_levels = []
    }
    
    func testing() -> String {
        return "This is a string"
    }
    
    func init_levels() {
        all_levels = [
            // entrance
            Level (
                name: "entrance",
                number: 0,
                choice_A: choice_A,
                choice_B: choice_B,
                chatbox: chatbox,
                char_view: char_view,
                char_img: "40f.jpg",
                states: [
                    State (
                        state_name: "introduction",
                        state_number: 0,
                        dialouge_text: "before you lays a dark entrance",
                        choice_A_text: "go in",
                        choice_B_text: "turn around and go home",
                        choice_A_next_State: "a state",
                        choice_B_next_State: "b state",
                        choice_A: choice_A,
                        choice_B: choice_B
                    )
                ])
            //
        ]
    }
    
}
