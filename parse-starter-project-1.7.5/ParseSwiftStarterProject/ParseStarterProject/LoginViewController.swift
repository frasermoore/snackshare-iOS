//
//  LoginViewController.swift
//  SnackShare
//
//  Created by Ranit Dubey on 7/28/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func showSignupScreen(sender: UIButton) {
        performSegueWithIdentifier("ShowSignupScreen", sender: nil)
    }
    
    @IBAction func loginUser(sender: UIButton) {
        
    }
    
}
