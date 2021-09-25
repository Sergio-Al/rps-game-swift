//
//  ViewController.swift
//  RPS
//
//  Created by Sergio Alejandro Machaca Lamas on 24/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func rockAction(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperAction(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsAction(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func playAgainAction(_ sender: Any) {
        updateGameState(.start)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateGameState(.start)
    }
    
    func updateGameState(_ state:GameState){
        if state == .start {
            gameStatus.text = "Choose a Sign"
            mainSign.text = "🤖"
            playAgainButton.isHidden = true
            setAllSignsState(Enabled: true, Hidden: false)
            view.backgroundColor = UIColor.init(red: 197 / 255, green: 242 / 255, blue: 249 / 255, alpha: 1)
        } else if state == .draw {
            gameStatus.text = "This is a Draw!"
            view.backgroundColor = UIColor.init(red: 213/255, green: 222/255, blue: 223/255, alpha: 1)
        } else if state == .lose {
            gameStatus.text = "Oh! you lose"
            view.backgroundColor = UIColor.init(red: 255/255, green: 92/255, blue: 53/255, alpha: 1)
        } else if state == .win {
            gameStatus.text = "You Win!"
            view.backgroundColor = UIColor.init(red: 150/255, green: 255/255, blue: 103/255, alpha: 1)
        }
    }
    
    func setAllSignsState(Enabled isEnabled:Bool, Hidden isHidden:Bool){
        rockButton.isEnabled = isEnabled
        paperButton.isEnabled = isEnabled
        scissorsButton.isEnabled = isEnabled
        
        rockButton.isHidden = isHidden
        paperButton.isHidden = isHidden
        scissorsButton.isHidden = isHidden
    }
    
    func play(_ sign:Sign){
        let robotSign = randomSign()
        updateGameState(sign.findState(robotSign))
        setAllSignsState(Enabled: false, Hidden: true)
        mainSign.text = robotSign.emoji
        switch sign {
        case .paper:
            paperButton.isHidden = false
        case .rock:
            rockButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        }
        playAgainButton.isHidden = false
    }

}

