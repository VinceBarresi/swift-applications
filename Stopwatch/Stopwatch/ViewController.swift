//
//  ViewController.swift
//  Stopwatch
//
//  Created by Vincent Barresi on 3/13/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = NSTimer()
    var count = 0
    
    @IBOutlet weak var timerDisplay: UILabel!
    
    func updateTimer() {
        count++
        timerDisplay.text = "\(count)"
    }
    
    @IBAction func startTimer(sender: AnyObject) {
         timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        timer.invalidate()
        count = 0
        timerDisplay.text = "0"
    }
    
    
    @IBAction func pauseTimer(sender: AnyObject) {
        timer.invalidate()
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

