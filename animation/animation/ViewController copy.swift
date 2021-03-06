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
    
    let characters: [Character] = [
        Character(name: "Jared")
    ]
        
    let jared = Character(name: "Jared")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sendSubviewToBack(character_view)
        view.sendSubviewToBack(background_view)
        
        pre_game()
        //start_game()
    }
    
    @objc func pre_game_dialouge(_ sender: UIButton) {
        let dialouge: [String] = [
            "This is the game where choices matter",
            "Please proceed wisely"
        ]
        
        chatbox.text = dialouge[sender.tag]
        
    }
    
    func pre_game() {
        let step: Int = 0
        
        choice_A.isEnabled = true
        choice_B.isEnabled = false
        choice_A.setTitle("continue...", for: .normal)
        choice_B.setTitle("-", for: .normal)
        
        chatbox.text = "Welcome to Bandersnatch"
        choice_A.tag = step
        choice_A.addTarget(self, action: #selector(ViewController.pre_game_dialouge(_:)), for: .touchUpInside)
    }
    

    
    func start_game() {
        let chatbox_height = chatbox.bounds.height
        
        character_view.image = UIImage(named: "40f.jpg")
        
        set_appear_animate(from: (screen_height / 2) + (chatbox_height / 2), to: (screen_height / 2) - (chatbox_height / 2) - 150, duration: 3, a_view: character_view)
        set_interact(chat: chatbox, top_button: choice_A, bottom_button: choice_B, chat_text: "A wild Pikachu appears", top_button_text: "Fight", bottom_button_text: "Run Away")
    }
    
    func set_appear_animate(from: CGFloat, to: CGFloat, duration: Double, a_view: UIView) {
        let animation = CABasicAnimation()
        
        animation.keyPath = "position.y"
        animation.fromValue = from
        animation.toValue = to
        animation.duration = duration
        
        a_view.layer.add(animation, forKey: "basic")
    }
    
    func set_interact(chat: UILabel, top_button: UIButton, bottom_button: UIButton, chat_text: String, top_button_text: String, bottom_button_text: String) {
        chat.text = chat_text
        top_button.setTitle(top_button_text, for: .normal)
        bottom_button.setTitle(bottom_button_text, for: .normal)
    }

}
