//
//  ViewController.swift
//  Animations
//
//  Created by Vincent Barresi on 4/4/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    var timer = NSTimer()
    var isAnimating = true
    
    @IBOutlet weak var gifMeBtn: UIButton!
    @IBOutlet weak var musicImage: UIImageView!
    
    @IBAction func gifMeBtn(sender: AnyObject) {
        musicImage.image = UIImage(named: "music-frame1.png")
        
        if isAnimating == true  {
            timer.invalidate()
            isAnimating = false
            gifMeBtn.setTitle(".gif me", forState: UIControlState.Normal)
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
            gifMeBtn.setTitle("un .gif me", forState: UIControlState.Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func doAnimation() {
        count == 5 ? [count = 1] : [count += 1]
        musicImage.image = UIImage(named: "music-frame\(count).png")
    }

    /*
    override func viewDidLayoutSubviews() {
        musicImage.center = CGPointMake(musicImage.center.x - 400, musicImage.center.y)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            
            self.musicImage.center = CGPointMake(self.musicImage.center.x+400, self.musicImage.center.y)
        }
    }
*/
}

