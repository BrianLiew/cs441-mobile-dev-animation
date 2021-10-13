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
    
    public var levels: Levels

    // var all_levels = Levels.all_levels
    // singleton declaration
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.sendSubviewToBack(character_view)
        view.sendSubviewToBack(background_view)
        
        levels = Levels(choice_A: choice_A, choice_B: choice_B, chatbox: chatbox, char_view: character_view);
        if let unwrapped_levels = levels {
            unwrapped_levels.init_levels()
        }
        print(levels?.all_levels)
    }
    
}
