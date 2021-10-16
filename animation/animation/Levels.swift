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
            name: "failed dungeon",
            number: -1,
            dialouge_text: "you are weak-willed. you may be alive, but you fail in life",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let dungeon_1 = State (
            name: "entering decision confirmation",
            number: 0,
            dialouge_text: "are you sure?",
            choice_A_text: "yes! let me in already...",
            choice_B_text: "... no",
            choice_A_next_state: nil,
            choice_B_next_state: dungeon_fail,
            next_level: nil,
            animation_type: animations.none
        )
        let dungeon_0 = State (
            name: "entering decision",
            number: 0,
            dialouge_text: "A dark doorway appears before you. Do you wish to enter the dungeon?",
            choice_A_text: "Yes",
            choice_B_text: "No",
            choice_A_next_state: dungeon_1,
            choice_B_next_state: dungeon_1,
            next_level: nil,
            animation_type: animations.appear
        )
        let start_0 = State (
            name: "start game",
            number: 0,
            dialouge_text: "Bandersnatch: Dungeons",
            choice_A_text: "start",
            choice_B_text: "start",
            choice_A_next_state: dungeon_0,
            choice_B_next_state: dungeon_0,
            next_level: nil,
            animation_type: animations.none
        )
        // LEVEL INTIALIZATION
        // WARNING: appending new levels from top, not bottom
        let dungeon_level = Level (
            name: "dungeon entrance",
            number: 0,
            char_img: "40f.jpg",
            states:
                [
                    start_0,
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
