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
        let quit_game = State (
            name: "quit game",
            number: -0.5,
            dialouge_text: "Game Quit",
            choice_A_text: "",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        //
        let dungeon_level_1_fail = State (
            name: "failed level 1",
            number: -2.0,
            dialouge_text: "",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let dungeon_level_1_mob_angered = State (
            name: "dungeon level 1 mob angered",
            number: -2.1,
            dialouge_text: "The rat is slightly hurt. It runs into the distance and prepares its next attack. What will you do?",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.angered
        )
        let dungeon_level_1_mob_hurt = State (
            name: "dungeon level 1 mob hurt",
            number: 2.1,
            dialouge_text: "The rat is severely hurt and scurries away. Congratulations!",
            choice_A_text: "Celebrate in silence",
            choice_B_text: "Celebrate with cheer",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.dazed_and_defeated
        )
        let dungeon_level_1_mob_appears = State (
            name: "dungeon leve 1 mob appears",
            number: 2.0,
            dialouge_text: "A disease-ridden rat greets you by the door, what will you do?",
            choice_A_text: "Step on it",
            choice_B_text: "Kick it",
            choice_A_next_state: dungeon_level_1_mob_hurt,
            choice_B_next_state: dungeon_level_1_mob_angered,
            next_level: nil,
            animation_type: animations.appear
        )
        // ENTRANCE TO DUNGEON LEVEL 1 TRANSITION
        let entrance_transition_dungeon_level_1 = State (
            name: "entrance transition dungeon level 1",
            number: 1.2,
            dialouge_text: "Now entering: level 1",
            choice_A_text: "Proceed",
            choice_B_text: "Quit",
            choice_A_next_state: dungeon_level_1_mob_appears,
            choice_B_next_state: quit_game,
            next_level: dungeon_level_1,
            animation_type: animations.disappear
        )
        // ENTRANCE LEVEL STATES
        let entrance_fail = State (
            name: "failed entrance",
            number: -1.0,
            dialouge_text: "Cowards do not prosper. Reevalute your character.",
            choice_A_text: "-",
            choice_B_text: "-",
            choice_A_next_state: nil,
            choice_B_next_state: nil,
            next_level: nil,
            animation_type: animations.disappear
        )
        let entrance_decision_yes_confirmation = State (
            name: "entering decision yes confirmation",
            number: 1.1,
            dialouge_text: "The door creaks open slowly, muffled screams and howls ensue. Are you sure?",
            choice_A_text: "Soldier on",
            choice_B_text: "Turn around",
            choice_A_next_state: entrance_transition_dungeon_level_1,
            choice_B_next_state: entrance_fail,
            next_level: nil,
            animation_type: animations.none
        )
        let entrance_decision_no_confirmation = State (
            name: "entering decision no confirmation",
            number: -1.1,
            dialouge_text: "The door whispers eerily 'you, mortal, are fearful and cowardace'. Are you sure?",
            choice_A_text: "Turn around",
            choice_B_text: "Keep walking",
            choice_A_next_state: entrance_transition_dungeon_level_1,
            choice_B_next_state: entrance_fail,
            next_level: nil,
            animation_type: animations.none
        )
        let entrance_decision = State (
            name: "entrance decision",
            number: 1.0,
            dialouge_text: "A dilapitaed wooden door is summoed before you. Do you enter?",
            choice_A_text: "Yes",
            choice_B_text: "No",
            choice_A_next_state: entrance_decision_yes_confirmation,
            choice_B_next_state: entrance_decision_no_confirmation,
            next_level: nil,
            animation_type: animations.appear
        )
        // PRE GAME STATES
        let pre_game = State (
            name: "pre game",
            number: 0.5,
            dialouge_text: "Bandersnatch: Dungeons",
            choice_A_text: "Start",
            choice_B_text: "Quit",
            choice_A_next_state: entrance_decision,
            choice_B_next_state: quit_game,
            next_level: nil,
            animation_type: animations.none
        )
        // all_levels INITIALIZATION
        all_levels = [
            entrance_level,
            dungeon_level_1
        ]
        all_states = [
            pre_game,
            entrance_decision,
            entrance_decision_yes_confirmation,
            entrance_decision_no_confirmation,
            entrance_transition_dungeon_level_1,
            dungeon_level_1_mob_appears
        ]
    }
    
    func get_level(number: Int) -> Level? {
        for level in all_levels { if number == level.number { return level } }
        return nil
    }
    
    func get_state(number: Double) -> State? {
        for state in all_states { if number == state.number { return state } }
        return nil
    }
    
}
