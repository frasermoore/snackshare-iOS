//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class SignupViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        if ((PFUser.currentUser()) != nil) {
            self.performSegueWithIdentifier("showFeedViewController", sender: self)
        }
    }
    
    func signupUser() {
        var user = PFUser()
        user.username = self.usernameTextField.text!
        user.password = self.passwordTextField.text!

        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                println("Parse user created.")
                self.performSegueWithIdentifier("showFeedViewController", sender: self)
            }
        }
    }

    @IBAction func signUpButtonClicked(sender: UIButton) {
        signupUser()
    }
    
    @IBAction func returnToLoginScreen(sender: UIButton) {
        self.performSegueWithIdentifier("GoBackToLoginScreen", sender: nil)
    }
}

