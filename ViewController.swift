//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Jeffrey Zhu on 2020-11-05.
//

import UIKit

class ViewController: UIViewController {
    
    var selection = ""
    let options = ["👊", "✋", "✌️"] // Constants
    let winConditions = ["👊": "✌️", "✋": "👊", "✌️": "✋"] // Dictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var computerLabel: UILabel!
    
    @IBOutlet weak var computerResult: UILabel!
    
    @IBOutlet weak var outcome: UILabel!
    /*
     IB stands interface builder
     */
    @IBAction func selectRock(_ sender: Any) {
        selection = "👊"
        label.text = "You have chosen \(selection)"
    }
    

    @IBAction func selectPaper(_ sender: Any) {
        selection = "✋"
        label.text = "You have chosen \(selection)"
    }
    
    @IBAction func selectScissor(_ sender: Any) {
        selection = "✌️"
        label.text = "You have chosen \(selection)"
    }
    
    func getResult() {
        var message = ""
        // Create a random hand
        let computerMove = options.randomElement()!
        computerResult.text = computerMove
        // Compare that to the selection variable
        if computerMove == selection {
            message = "Tie game!"
        } else if selection == winConditions[computerMove] {
            message = "You just lost to a computer!"
        } else if computerMove == winConditions[selection] {
            message = "You just beat a computer... Congrats?"
        }
        // Declare winner
        outcome.text = message
    }
    
    @IBAction func startGame(_ sender: Any) {
        var counter = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if counter > 0 {
                self.label.text = "You have chosen \(self.selection)\n\(counter)"
            } else {
                timer.invalidate()
                self.getResult()
            }
            counter -= 1
        }
    }
}

