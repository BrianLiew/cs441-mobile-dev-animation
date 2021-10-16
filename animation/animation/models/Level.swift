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
        for state in states { if number == state.number { return state } }
        return nil
    }
    
}
