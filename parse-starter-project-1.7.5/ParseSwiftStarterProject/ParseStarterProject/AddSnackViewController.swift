//
//  AddSnackViewController.swift
//  SnackShare
//
//  Created by Fraser Moore on 7/21/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class AddSnackViewController: UIViewController {
    
    var delegate: AddSnackDelegate?
    
    @IBOutlet weak var snackTextField: UITextField!
    
    @IBAction func addSnack(sender: UIButton) {
        //push new snack object to parse
        var snackItem = PFObject(className:"SnackItem")
        snackItem["requester"] = PFUser.currentUser()?.username!
        snackItem["snackName"] = self.snackTextField.text!
        snackItem.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        self.delegate!.addSnack(snackItem)
        self.navigationController?.popViewControllerAnimated(true)
    }
}

protocol AddSnackDelegate {
    func addSnack(snack: PFObject?)
}