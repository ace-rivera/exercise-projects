//
//  ViewController.swift
//  LoginPage
//
//  Created by Joshua Relova on 7/18/16.
//  Copyright © 2016 Joshua Relova. All rights reserved.
//

import UIKit
import TPKeyboardAvoiding
import Firebase
import FirebaseAuth
import MBProgressHUD

class LogInPage: UIViewController {

  @IBOutlet weak var mainScrollView: TPKeyboardAvoidingScrollView!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var logInButton: UIButton!
  @IBOutlet weak var signUpButton: UIButton!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mainScrollView.backgroundColor = UIColor(patternImage: UIImage(named:"LoginBackGround")!)
    passwordTextField.underlined()
    userNameTextField.underlined()
    
    
  }
  
  override func viewWillAppear(animated: Bool) {
    self.navigationController?.navigationBarHidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillDisappear(animated: Bool) {
    self.navigationController?.navigationBarHidden = false
  }


  @IBAction func signUpButtonWasPressed(sender: AnyObject) {
    self.performSegueWithIdentifier("pushToSignUpPage", sender: self)
  }

  @IBAction func logInButtonWasPressed(sender: AnyObject) {
    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    hud.mode = MBProgressHUDMode.Indeterminate
    hud.labelText = "Verifying Email and Password"
    
    FIRAuth.auth()?.signInWithEmail(userNameTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
      if let error = error {
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        AlertController.showErrorAlertController(error.localizedDescription, view: self)
      }
      else{
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
        self.performSegueWithIdentifier("pushToFeedsPage", sender: self)
      }
      
    })
  }
  
  func clearTextfields(){
    userNameTextField.text = ""
    passwordTextField.text = ""
    
  }
  
}

 extension UITextField {
  
  func underlined(){
    let border = CALayer()
    let width = CGFloat(1.0)
    border.borderColor = UIColor.lightGrayColor().CGColor
    border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
    border.borderWidth = width
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
  }
  
 
}




