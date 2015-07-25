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
        self.delegate!.addSnack(self.snackTextField.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}

protocol AddSnackDelegate {
    func addSnack(snack: String?)
}