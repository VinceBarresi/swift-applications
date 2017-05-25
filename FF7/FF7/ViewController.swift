//
//  ViewController.swift
//  FF7
//
//  Created by Vincent Barresi on 5/8/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func playBtn(_ sender: AnyObject) {
        player.play()
    }
    
    
    @IBAction func getVolume(_ sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    @IBAction func stopBtn(_ sender: AnyObject) {
        player.stop()
        player.currentTime = 0
    }
    
    
    @IBAction func pauseBtn(_ sender: AnyObject) {
        player.pause()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ff7Theme = Bundle.main.path(forResource: "ff7-main-theme", ofType: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: URL(string: ff7Theme)!)
        } catch {
            print("Error getting audio")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

