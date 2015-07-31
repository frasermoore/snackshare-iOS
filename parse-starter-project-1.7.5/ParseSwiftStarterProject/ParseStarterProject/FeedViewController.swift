//
//  FeedViewController.swift
//  SnackShare
//
//  Created by Fraser Moore on 7/21/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class FeedViewController: UITableViewController, AddSnackDelegate {
    
    var snackItems: [PFObject]  = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get snack items form parse db
        var query = PFQuery(className:"SnackItem")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects2 = objects as? [PFObject] {
                    self.snackItems = objects2
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
            } else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snackItems.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:SnackTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! SnackTableViewCell
        
        cell.snackName?.text = self.snackItems[indexPath.row]["snack"] as? String
        cell.personName?.text = self.snackItems[indexPath.row]["requester"] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            self.performSegueWithIdentifier("ShowShareSnack", sender: indexPath)
    }
    
    func addSnack(snack: PFObject?) {
        self.snackItems.append(snack!)
        self.tableView!.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = sender as! NSIndexPath
        if (segue.identifier! == "ShowAddSnack") {
            let asvc = segue.destinationViewController as! AddSnackViewController
            asvc.delegate = self
        }
        
        if segue.identifier! == "ShowShareSnack" {
            let ssvc = segue.destinationViewController as! ShareSnackViewController
            ssvc.snackName = (self.snackItems[indexPath.row]["snack"] as? String)!
            ssvc.requester = (self.snackItems[indexPath.row]["requester"] as? String)!
        }
    }
}