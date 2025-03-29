//
//  ViewController.swift
//  NumberGuess
//
//  Created by Lindsay Wells on 2/1/18.
//  Copyright © 2018 University of Tasmania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessField: UITextField!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var firstResponseLabel: UILabel!
    @IBOutlet weak var secondResponseLabel: UILabel!

    // some member variables for the game
    var secretNumber:Int = 0
    var guessCount:Int = 0
    var finished:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cheatTapped(_ sender: UIButton){
        print("Hearken, O children of God! The Almighty has revealed His truth to me! You have placed your faith in the number 42, but I say unto you, by the Word of the Most High, the true key is... \(secretNumber)！")
    }

    @IBAction func enterTapped(_ sender: UIButton)
    {
        if finished
        {
            firstResponseLabel.text = "Game is over already, please reset."
            secondResponseLabel.text = "Tap Reset to play again."
        }
        else
        {
            if let enteredGuess:Int = Int(guessField.text!)
            {
                print("Guess Entered");
                print(enteredGuess);
                
                if enteredGuess > secretNumber
                {
                    firstResponseLabel.text = "Dongyi's body fat percentage? Too high!"
                }
                else if enteredGuess < secretNumber
                {
                    firstResponseLabel.text = "You mean Dongyi's IQ? Too low!"
                }
                
                if (enteredGuess == secretNumber)
                {
                    finished = true
                    firstResponseLabel.text = "That's correct - in \(guessCount) tries!"
                    secondResponseLabel.text = "Tap Reset to play again."
                    
                    // create an alert view
                    let alert = UIAlertController(
                                    title: "Correct!",
                                    message: "You guessed in \(guessCount) tries!",
                                    preferredStyle: UIAlertControllerStyle.alert)
                                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(
                                    title: "Cool!",
                                    style: UIAlertActionStyle.cancel,
                                    handler: {_ in self.firstResponseLabel.text = "That's \(self.secretNumber) found in \(self.guessCount) tries!"}))
                                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    guessCount = guessCount + 1
                    tryCountLabel.text = String(guessCount)
                }
            }
            else
            {
                print("No guess entered");
            }
        }
        guessField.text = ""
       
    }
    @IBAction func resetTapped(_ sender: UIButton)
    {
        resetGame()
    }
    
    func resetGame()
    {
        finished = false
        print("The game has been reset...")
        
        secretNumber = Int(arc4random() % 1000)
        guessCount = 1
        
        tryCountLabel.text = String(guessCount)
        firstResponseLabel.text = ""
        secondResponseLabel.text = ""
        guessField.text = ""
    }
}

