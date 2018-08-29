//
//  ViewController.swift
//  Guessing IOS app
//
//  Created by Dakota Brown on 8/28/18.
//  Copyright © 2018 Dakota Brown. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UI elements
    @IBOutlet weak var numEnter: UITextField!
    @IBOutlet weak var guessLeft: UILabel!
    @IBOutlet weak var winLose: UILabel!
    @IBOutlet weak var debug: UILabel!
    
    //Variables
    var rand = Int(arc4random_uniform(101))
    var guessLeft1 = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debug.text = String(rand)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetGame() {
        rand = Int(arc4random_uniform(101))
        guessLeft1 = 5
        debug.text = String(rand)
    }
    @IBAction func showMessage(sender: UIButton) {
        let input = Int(numEnter.text!)
        if input == rand{
            numEnter.text = ""
            let alertController =
                UIAlertController(title: "You won with \(guessLeft1) guesses left.", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
                self.resetGame()
            }))
            alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if input! > rand {
            numEnter.text = ""
            winLose.text = "Guess too high, try again."
            guessLeft1 -= 1
            guessLeft.text = "You have \(guessLeft1) guesses left"
            if guessLeft1 == 0 && input! != rand {
                let alertController =
                    UIAlertController(title: "You lose", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
                    self.resetGame()
                }))
                alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
                present(alertController, animated: true, completion: nil)
            }
        } else if input! < rand {
            numEnter.text = ""
            winLose.text = "Guess too low, try again"
            guessLeft1 -= 1
            guessLeft.text = "You have \(guessLeft1) guesses left"
            if guessLeft1 == 0 && input! != rand {
                let alertController =
                    UIAlertController(title: "You lose", message: "Play Again?", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { (action) in
                        self.resetGame()
                    }))
                    alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
                    present(alertController, animated: true, completion: nil)
                }
            }
        }
    }



