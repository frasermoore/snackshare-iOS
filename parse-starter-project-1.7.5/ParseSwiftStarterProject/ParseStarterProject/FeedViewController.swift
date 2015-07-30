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
                if let objects = objects as? [PFObject] {
                    self.snackItems = objects
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
        
        cell.snackName?.text = self.snackItems[indexPath.row]["snack"] as! String
        cell.personName?.text = self.snackItems[indexPath.row]["requestor"] as! String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func addSnack(snack: PFObject?) {
        self.snackItems.append(snack!)
        self.tableView!.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "ShowAddSnack") {
            let asvc = segue.destinationViewController as! AddSnackViewController
            asvc.delegate = self
        }
    }
}