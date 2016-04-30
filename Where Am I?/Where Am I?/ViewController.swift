//
//  ViewController.swift
//  Where Am I?
//
//  Created by Vincent Barresi on 4/25/16.
//  Copyright © 2016 Vincent Barresi. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    
    var manager:CLLocationManager!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy - kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placeMarks, error) -> Void in
            
            if (error != nil) {
                print(error)
            } else {
                if let validPlacemark = placeMarks?[0] {
                    
                    var subThoroughfare: String = ""
                    
                    if (validPlacemark.subThoroughfare != nil) {
                        subThoroughfare = validPlacemark.subThoroughfare!
                    }
                    self.addressLabel.text = "\(subThoroughfare) \(validPlacemark.thoroughfare) \(validPlacemark.locality) \(validPlacemark.subAdministrativeArea) \(validPlacemark.postalCode) \(validPlacemark.country)"
                }
                
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

