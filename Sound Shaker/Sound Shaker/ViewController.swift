//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Barresi, Vincent on 5/20/16.
//  Copyright © 2016 Barresi, Vincent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer = AVAudioPlayer()
    var sounds = ["beatrush", "bigshot", "bolt", "bolt2", "bring", "cross", "cure", "hit", "ice", "kaching", "kill", "limit", "magic", "sickle", "sleeple", "sthip"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            let randomNumber = (Int(arc4random_uniform(UInt32(sounds.count))))
            let ff7Sound = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "wav")!
            do {
                player = try AVAudioPlayer(contentsOfURL: (NSURL(string: ff7Sound))!)
                player.play()
            } catch {
                print("Error getting audio")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

