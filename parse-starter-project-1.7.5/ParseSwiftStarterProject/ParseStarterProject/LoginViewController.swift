//
//  LoginViewController.swift
//  SnackShare
//
//  Created by Ranit Dubey on 7/28/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    @IBAction func showSignupScreen(sender: UIButton) {
        performSegueWithIdentifier("ShowSignupScreen", sender: nil)
    }
    
    @IBAction func loginUser(sender: UIButton) {
        //maybe check to see if username/password field is blank before parse api request for user object.
        
        PFUser.logInWithUsernameInBackground(self.usernameTextField.text!, password:self.passwordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                self.performSegueWithIdentifier("showFeedViewController", sender: nil);
            } else {
                // The login failed. Check error to see why.
                var alert = UIAlertController(title: "Login Failed", message: "Invalid username or password", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == self.usernameTextField) {
            self.passwordTextField.becomeFirstResponder()
        } else {
            self.passwordTextField.resignFirstResponder()
        }
        return true
    }
    
}
