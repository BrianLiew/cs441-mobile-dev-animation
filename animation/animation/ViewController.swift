//
//  ViewController.swift
//  animation
//
//  Created by Brian Liew on 10/6/21.
//

import UIKit

let screen_width = UIScreen.main.bounds.width
let screen_height = UIScreen.main.bounds.height

class ViewController: UIViewController {
    
    @IBOutlet var background_view: UIImageView!
    @IBOutlet var character_view: UIImageView!
    @IBOutlet var chatbox: UILabel!
    @IBOutlet var control_view: UIImageView!
    @IBOutlet var choice_A: UIButton!
    @IBOutlet var choice_B: UIButton!
    
    var levels: [Level] = []
    var current_level: Level? = nil
        
    var entrance_dialouge: [String] = [
        "A wild Pikachu appears!",
        "What will you do?"
    ]
    
    var entrance_choice_A_text: [String] = [
        "-",
        "Throw rock"
    ]
    
    var entrance_choice_B_Text: [String] = [
        "-",
        "Run past"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sendSubviewToBack(character_view)
        view.sendSubviewToBack(background_view)
        
        game_init()
        start_game()
    }
    
    func game_init() {
        let levels_init: [Level] = [
            Level(
                name: "entrance",
                number: 0,
                a_choice_A: choice_A,
                a_choice_B: choice_B,
                a_chatbox: chatbox,
                a_char_view: character_view,
                a_char_img: "40f.jpg",
                dialouge: entrance_dialouge,
                choice_A_text: entrance_choice_A_text,
                choice_B_text: entrance_choice_B_Text
            )
        ]
        for level in levels_init { levels.append(level) }
        
        print("game initialized with \(levels.count) level(s)")
    }
    
    func start_game() {
        current_level = levels[0]
        guard let room = current_level else { return }
        room.set_appear_animate(from: (screen_height / 2) + (chatbox.bounds.height / 2), to: (screen_height / 2) - (chatbox.bounds.height / 2) - 150, duration: 3, a_view: character_view)
        
    }
    
}
