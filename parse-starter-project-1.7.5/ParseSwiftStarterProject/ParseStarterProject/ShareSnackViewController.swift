//
//  ShareSnackViewController.swift
//  SnackShare
//
//  Created by Ranit Dubey on 7/30/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

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
        
    }
}
