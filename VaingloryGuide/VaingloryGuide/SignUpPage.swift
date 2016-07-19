//
//  SignUpPage.swift
//  LoginPage
//
//  Created by Joshua Relova on 7/18/16.
//  Copyright © 2016 Joshua Relova. All rights reserved.
//

import UIKit
import FirebaseAuth
import MBProgressHUD
import TPKeyboardAvoiding


class SignUpPage: UIViewController {

  @IBOutlet weak var signUpPageScrollView: TPKeyboardAvoidingScrollView!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      signUpPageScrollView.backgroundColor = UIColor(patternImage: UIImage(named:"LoginBackGround")!)
      confirmPasswordTextField.underlined()
      passwordTextField.underlined()
      emailTextField.underlined()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func signUpButtonWasPressed(sender: AnyObject) {
    let email = emailTextField.text!
    let password = passwordTextField.text!
    let confirmPassword = confirmPasswordTextField.text!
    
    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    hud.mode = MBProgressHUDMode.Indeterminate
    hud.labelText = "Signing Up"
    
    if ((password == confirmPassword) && (password.characters.count > 7)) {
      FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (user, error) in
        
        if let error = error {
          self.clearTextfields()
          MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
          AlertController.showErrorAlertController(error.localizedDescription, view: self)
        }
        else{
          MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
          AlertController.showSuccessAlertController("Sign Up successful, Please Login To Continue", view: self)
        }
        
      })
    }
    else{
      MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
      AlertController.showErrorAlertController("Password should be at least 8 characters long", view: self)
    }
  }
  
  func clearTextfields(){
    emailTextField.text = ""
    passwordTextField.text = ""
    confirmPasswordTextField.text = ""

  }
  
  
}




