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
    
    public var all_levels: [Level] = []
    public var all_states: [State] = []
    
    init() {
        // LEVEL INTIALIZATION
        // WARNING: appending new levels from top, not bottom
        let dungeon_level_1 = Level (
            name: "dungeon level 1",
            number: 0,
            char_img: "rat.png"
        )
        let entrance_level = Level (
            name: "dungeon entrance",
            number: 0,
            char_img: "dungeon_door.jpeg"
        )
        // STATE INITIALIZATION
        // WARNING: appending new states from top, not bottom
        // DUNGEON LEVEL 1 STATES
        let dungeon_level_1_fail = State (
            name: "failed level 1",
            number: -2,
            dialouge_text: "",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let dungeon_level_1_2 = State (
            name: "failed entrance",
            number: 4,
            dialouge_text: "you are weak-willed. you may be alive, but you fail in life",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let dungeon_level_1_1 = State (
            name: "entering dungeon level 1",
            number: 3,
            dialouge_text: "a disease-ridden rat greets you by the door, what will you do?",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.appear
        )
        // ENTRANCE LEVEL STATES
        let entrance_fail = State (
            name: "failed entrance",
            number: -1,
            dialouge_text: "you are weak-willed. you may be alive, but you fail in life",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let entrance_2 = State (
            name: "leaving entrance, proceed to dungeon level 1",
            number: 2,
            dialouge_text: "...",
            choice_A_text: "...",
            choice_B_text: "...",
            choice_A_next_state: dungeon_level_1_1,
            choice_B_next_state: dungeon_level_1_1,
            next_level: dungeon_level_1,
            animation_type: animations.disappear
        )
        let entrance_1 = State (
            name: "entering decision confirmation",
            number: 2,
            dialouge_text: "are you sure?",
            choice_A_text: "yes! let me in already...",
            choice_B_text: "... no",
            choice_A_next_state: entrance_2,
            choice_B_next_state: entrance_fail,
            next_level: nil,
            animation_type: animations.none
        )
        let entrance_0 = State (
            name: "entering decision",
            number: 1,
            dialouge_text: "A dark doorway appears before you. Do you wish to enter the dungeon?",
            choice_A_text: "Yes",
            choice_B_text: "No",
            choice_A_next_state: entrance_1,
            choice_B_next_state: entrance_1,
            next_level: nil,
            animation_type: animations.appear
        )
        let start_0 = State (
            name: "start game",
            number: 0,
            dialouge_text: "Bandersnatch: Dungeons",
            choice_A_text: "start",
            choice_B_text: "start",
            choice_A_next_state: entrance_0,
            choice_B_next_state: entrance_0,
            next_level: nil,
            animation_type: animations.none
        )
        // all_levels INITIALIZATION
        all_levels = [
            entrance_level,
            dungeon_level_1
        ]
        all_states = [
            start_0,
            entrance_0,
            entrance_1,
            entrance_fail,
            dungeon_level_1_1,
            dungeon_level_1_fail
        ]
    }
    
    func get_level(number: Int) -> Level? {
        for level in all_levels { if number == level.number { return level } }
        return nil
    }
    
    func get_state(number: Int) -> State? {
        for state in all_states { if number == state.number { return state } }
        return nil
    }
    
}
