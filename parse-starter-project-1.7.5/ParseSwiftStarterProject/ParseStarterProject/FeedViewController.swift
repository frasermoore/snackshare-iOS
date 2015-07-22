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

class FeedViewController: UITableViewController {
    
    var items: [String] = ["We", "Heart", "Swift"]
    
    var snacks: [String] = ["BEANS", "SPAGHETTI", "BONE"]
    var names: [String] = ["JIM", "BOB", "LASSIE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerClass(SnackTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:SnackTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! SnackTableViewCell
        
        cell.snackName?.text = self.snacks[indexPath.row]
        cell.personName?.text = self.names[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}