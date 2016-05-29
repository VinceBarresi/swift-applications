//
//  MasterViewController.swift
//  Google Blog Reader
//
//  Created by Barresi, Vincent on 5/23/16.
//  Copyright © 2016 Barresi, Vincent. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    var managedObjectContext: NSManagedObjectContext? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context: NSManagedObjectContext = appDel.managedObjectContext
        let url = NSURL(string:"https://www.googleapis.com/blogger/v3/blogs/2399953/posts?key=AIzaSyCY8_1c_xFZQtH3DrHxnRUxnzbqJlqmd24")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: { data, response, error -> Void in
            
            if (error != nil) {
                print("error: \(error)")
            } else {
                do {
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                    print(1)
                    if jsonResult.count > 0 {
                        if let itemsObject = jsonResult["items"] as? NSArray {
                            print(2)
                            let fetchRequest = NSFetchRequest(entityName: "Posts")
                            fetchRequest.returnsObjectsAsFaults = false
                            do {
                                let results = try context.executeFetchRequest(fetchRequest)
                                if results.count > 0 {
                                    print(3)
                                    for item in itemsObject {
                                        print(4)
                                            if let title = item["title"] as? NSString {
                                                if let content = item["content"] as? NSString {
                                                    let newPosts = NSEntityDescription.insertNewObjectForEntityForName("Posts", inManagedObjectContext: context)
                                            
                                                    newPosts.setValue(title, forKey: "title")
                                                    newPosts.setValue(content, forKey: "content")
                                                    do {
                                                        try context.save()
                                                    } catch let error as NSError {
                                                        print(error.localizedDescription )
                                                    }
                                                
                                                }
                                            }
                                        }
                                    }
                                
                            } catch let error as NSError {
                                print(error.localizedDescription)
                            }
                            
                            
                        }
                    }
                } catch {
                    print("error: \(error)")
                }
                self.tableView.reloadData()
            }
            
        })
        task.resume()
        
        
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            print("Show Detail")
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section] 
        return sectionInfo.numberOfObjects
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        self.configureCell(cell, withObject: object)
        return cell
    }

    func configureCell(cell: UITableViewCell, withObject object: NSManagedObject) {
        cell.textLabel!.text = object.valueForKey("title")!.description
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    // MARK: - Fetched results controller
    
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        let entity = NSEntityDescription.entityForName("Posts", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            //print("Unresolved error \(error), \(error.userInfo)")
            abort()
        }
        
        return _fetchedResultsController!
    }
    var _fetchedResultsController: NSFetchedResultsController? = nil
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    


}

