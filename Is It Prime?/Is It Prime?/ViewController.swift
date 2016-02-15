//
//  ViewController.swift
//  Is It Prime?
//
//  Created by Vincent Barresi on 2/14/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    

    @IBOutlet weak var enterNumber: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func primeButton(sender: AnyObject) {
        
        let number:Double? = Double(enterNumber.text!)
        
        if enterNumber.text != nil {
            
            
            if isPrime(number!) == true {
                resultLabel.text = "Number is prime"
            } else {
                resultLabel.text = "Number is not prime"
            }
            
        } else {
            resultLabel.text = "Please enter a number"
        }
    
    }
    

    func isPrime(number: Double) -> Bool {
        
        var i:Double = 0
        
        if number == 2 {
            return true
        }
        
        if number < 2 || number % 2 == 0 {
            return false
        }
        while i <= sqrt(number) {
            if number % i == 0 {
                return false
            }
            i += 2
        }

        return true
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

