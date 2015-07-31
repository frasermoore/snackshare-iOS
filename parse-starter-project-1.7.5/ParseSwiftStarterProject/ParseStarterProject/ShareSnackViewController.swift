//
//  ShareSnackViewController.swift
//  SnackShare
//
//  Created by Ranit Dubey on 7/30/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import Parse

class ShareSnackViewController: UIViewController {
    var snackName: String = ""
    var requester: String = ""

    @IBOutlet weak var requesterLabel: UILabel!
    @IBOutlet weak var snackLabel: UILabel!
    
    override func viewDidLoad() {
        self.snackLabel.text = self.snackLabel.text! + self.snackName
        self.requesterLabel.text = self.requesterLabel.text! + self.requester
    }
    @IBAction func shareSnack(sender: UIButton) {
        let user = PFUser.currentUser()
        
        // Create our Installation query
        let pushQuery = PFInstallation.query()
        pushQuery!.whereKey("user", equalTo: self.requester)

        // Send push notification to query
        let push = PFPush()
        push.setQuery(pushQuery) // Set our Installation query
        push.setMessage("\(user!.username) would like to share \(self.snackName) with you")
        push.sendPushInBackground()
    }
}
