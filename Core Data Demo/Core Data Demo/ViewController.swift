//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Barresi, Vincent on 5/20/16.
//  Copyright © 2016 Barresi, Vincent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        newUser.setValue("Vincent1", forKey: "username")
        newUser.setValue("Password1", forKey: "password")
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription )
        }
        let fetchRequest = NSFetchRequest(entityName: "Users")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if (results.count > 0) {
                for result: AnyObject in results {
                    if let user = result.valueForKey("username") {
                        if user as? String == "Vincent1" {
                            context.deleteObject(result as! NSManagedObject)
                            print(user)
                        }
                    }
                }
            }
                
            print(results)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

