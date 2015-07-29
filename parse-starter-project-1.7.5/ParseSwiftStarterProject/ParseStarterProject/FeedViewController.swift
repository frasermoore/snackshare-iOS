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
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    var snacks: [String] = ["BEANS", "SPAGHETTI", "BONE"]
    var names: [String] = ["JIM", "BOB", "LASSIE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get snack items form parse db
        var query = PFQuery(className:"SnackItem")
        query.findObjects(<#error: NSErrorPointer#>)
        query.getObjectInBackgroundWithId("xWMyZEGZ") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                println(gameScore)
            } else {
                println(error)
            }
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snacks.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:SnackTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! SnackTableViewCell
        
        cell.snackName?.text = self.snacks[indexPath.row]
        cell.personName?.text = self.names[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func addSnack(snack: String?) {
        self.snacks.append(snack!)
        self.names.append(snack!)
        self.tableView!.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier! == "ShowAddSnack") {
            let asvc = segue.destinationViewController as! AddSnackViewController
            asvc.delegate = self
        }
    }
}