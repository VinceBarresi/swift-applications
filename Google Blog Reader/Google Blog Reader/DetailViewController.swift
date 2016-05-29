//
//  DetailViewController.swift
//  Google Blog Reader
//
//  Created by Barresi, Vincent on 5/23/16.
//  Copyright © 2016 Barresi, Vincent. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var blogWebView: UIWebView!
  
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

