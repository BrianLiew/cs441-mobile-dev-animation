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
    
    static let shared_instance = Levels()
    
    func testing() -> String {
        return "This is a string"
    }
    
    public var all_levels: [Level] = [
        
    ]
    
    init() {
        // STATE INITIALIZATION
        // WARNING: appending new states from top, not bottom
        // dungeon_level states
        let dungeon_fail = State (
            state_name: "failed dungeon",
            state_number: -1,
            dialouge_text: "you are weak-willed. you may be alive, but you fail in life",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil
        )
        let dungeon_1 = State (
            state_name: "entering decision confirmation",
            state_number: 0,
            dialouge_text: "are you sure?",
            choice_A_text: "yes! let me in already...",
            choice_B_text: "... no",
            choice_A_next_state: nil,
            choice_B_next_state: dungeon_fail,
            next_level: nil
        )
        let dungeon_0 = State (
            state_name: "entering decision",
            state_number: 0,
            dialouge_text: "do you wish to enter the dungeon?",
            choice_A_text: "Yes",
            choice_B_text: "No",
            choice_A_next_state: dungeon_1,
            choice_B_next_state: dungeon_1,
            next_level: nil
        )
        // LEVEL INTIALIZATION
        // WARNING: appending new levels from top, not bottom
        let dungeon_level = Level (
            name: "dungeon entrance",
            number: 0,
            char_img: "40f.jpg",
            states:
                [
                    dungeon_0,
                    dungeon_1
                ]
        )
        // all_levels INITIALIZATION
        all_levels = [
            dungeon_level
        ]
    }
    
    func get_level(number: Int) -> Level? {
        for level in all_levels { if number == level.number { return level } }
        return nil
    }
    
}
