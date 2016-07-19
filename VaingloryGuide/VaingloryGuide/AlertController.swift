//
//  AlertController.swift
//  LoginPage
//
//  Created by Joshua Relova on 7/18/16.
//  Copyright © 2016 Joshua Relova. All rights reserved.
//

import UIKit

class AlertController: NSObject {

  class func showErrorAlertController (errorMessage : String, view:UIViewController) {
    
    let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .Alert)
    let alertButton = UIAlertAction(title: "OK", style: .Default) { (action) in
      
    }
    alertController.addAction(alertButton)
      view.presentViewController(alertController, animated: true) {
    }
  }

  class func showSuccessAlertController (successMessage : String, view:UIViewController) {
    
    let alertController = UIAlertController(title: "Success", message: successMessage, preferredStyle: .Alert)
    let alertButton = UIAlertAction(title: "OK", style: .Default) { (action) in
      // push view controller
    }
    
    alertController.addAction(alertButton)
    view.presentViewController(alertController, animated: true) {
    }
  }

}
