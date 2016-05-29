//
//  ViewController.swift
//  Storing Images
//
//  Created by Barresi, Vincent on 5/20/16.
//  Copyright © 2016 Barresi, Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var neoJapan: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://pre12.deviantart.net/c207/th/pre/i/2014/105/3/b/neo_japan_2202___dr_wayne_by_johnsonting-d7ej8se.jpg")
        let urlRequest = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(urlRequest) { (data, response, error) -> Void in
            
            if error != nil {
                print("There was an error with async request + \(error)")
            } else {
                let image = UIImage(data: data!)
                self.neoJapan.image = image
                var documentsDirectory: String?
                let paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                if paths.count > 0 {
                    documentsDirectory = paths.first as? String
                    let savePath = documentsDirectory! + "/neoJapan.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    self.neoJapan.image = UIImage(named: savePath)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

