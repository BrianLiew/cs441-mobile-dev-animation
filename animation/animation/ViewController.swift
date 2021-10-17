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
    //@IBOutlet var character_view: UIImageView!
    @IBOutlet var chatbox: UILabel!
    @IBOutlet var control_view: UIImageView!
    @IBOutlet var choice_A: UIButton!
    @IBOutlet var choice_B: UIButton!
    
    var character_view = UIImageView(frame: CGRect(x: screen_width / 2 - 150, y: screen_height / 2 - screen_width / 6, width: 300, height: 300))
    
    // singleton declaration
    let levels_instance = Levels.shared_instance
    
    var current_level: Level
    var current_state: State
    
    required init(coder aDecoder: NSCoder) {
        if let current_level_unwrapped = levels_instance.get_level(number: 0) {
            current_level = current_level_unwrapped
        } else { fatalError("cannot find level numbered 0, ViewController initialization failed") }
        if let current_state_unwrapped = levels_instance.get_state(number: 0.5) {
            current_state = current_state_unwrapped
        } else { fatalError("cannot find state numbered 0, ViewController initialization failed") }
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        character_view.backgroundColor = UIColor.systemRed
        
        view.addSubview(character_view)
        view.sendSubviewToBack(character_view)
        view.sendSubviewToBack(background_view)
        
        update_UI(current_state: current_state)
    }
    
    func update_UI(current_state: State) {
        chatbox.text = current_state.dialouge_text
        choice_A.setTitle(current_state.choice_A_text, for: .normal)
        choice_B.setTitle(current_state.choice_B_text, for: .normal)
        
        character_view.image = UIImage(named: current_level.char_img)
        
        current_state.play_animation(a_view: character_view)
    }
    
    @IBAction func choice_A_selected(_ sender: UIButton) {
        // VERIFICATION
        print("was on \(current_level.name) & \(current_state.name)")
        
        let next_config = current_state.choice_A_selected(animation_view: character_view)
        
        if let current_level_unwrapped = next_config.0 {
            current_level = current_level_unwrapped
        }
        if let current_state_unwrapped = next_config.1 {
            current_state = current_state_unwrapped
        }
        
        // VERIFICATION
        print("now on \(current_level.name) & \(current_state.name)")
        
        update_UI(current_state: current_state)
    }
    
    @IBAction func choice_B_selected(_ sender: UIButton) {
        // VERIFICATION
        print("was on \(current_level.name) & \(current_state.name)")
        
        let next_config = current_state.choice_B_selected(animation_view: character_view)
        
        if let current_level_unwrapped = next_config.0 {
            current_level = current_level_unwrapped
        }
        if let current_state_unwrapped = next_config.1 {
            current_state = current_state_unwrapped
        }
        
        // VERIFICATION
        print("now on \(current_level.name) & \(current_state.name)")
        
        update_UI(current_state: current_state)
    }
    
}
