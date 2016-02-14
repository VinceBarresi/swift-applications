//
//  ViewController.swift
//  How Mnay Fingers?
//
//  Created by Vincent Barresi on 2/14/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guess: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func guessButton(sender: AnyObject) {
        let randomNumber = arc4random_uniform(6)
        let guessInt:Int? = Int(guess.text!)
    
        if guessInt != nil {
            if guessInt == Int(randomNumber) {
                resultLabel.text = "You've guessed right!"
            } else {
                resultLabel.text = "Sorry! It was a \(randomNumber)"
            }
        } else {
            resultLabel.text = "Please enter a number between 1 - 5"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

