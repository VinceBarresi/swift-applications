//
//  ViewController.swift
//  cat years
//
//  Created by Vincent Barresi on 12/4/15.
//  Copyright © 2015 Vincent Barresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enterAge: UITextField!
    @IBOutlet weak var result: UITextField!
    
    @IBAction func calculateAge(sender: AnyObject) {
        let age:Int? = Int(enterAge.text!)
        if age != nil {
            let catAge = age! * 7
            result.text = "Your cat is \(catAge) in cat years"
        } else {
            result.text = "Enter valid age as a whole number"
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

