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
    
    @IBAction func updateImageBtn(sender: AnyObject) {
        
        count == 5 ? [count = 1] : [count += 1]
        
        musicImage.image = UIImage(named: "music-frame\(count).png")
        
    }
    
    @IBOutlet weak var musicImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

