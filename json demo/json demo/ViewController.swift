//
//  ViewController.swift
//  json demo
//
//  Created by Vincent Barresi on 5/22/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlPath = "http://api.giphy.com/v1/gifs/random?&api_key=dc6zaTOxFJmzC"
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: { data, response, error -> Void in
            
            if (error != nil) {
                print("error: \(error)")
            } else {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                    print(jsonResult)
                } catch {
                    print("error: \(error)")
                }
            }
            
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

