//
//  NameEntryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit
class NameEntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstName.underlined()
        lastName.underlined()
        textFieldShouldReturn(firstName)
        textFieldShouldReturn(lastName)
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Name"
        self.firstName.delegate = self
        self.lastName.delegate = self
    }

    
    //Close TextField 
    func textFieldShouldReturn(textField: UITextField) -> Bool     {
        self.firstName.resignFirstResponder()
        self.lastName.resignFirstResponder()
        return true
    }
    
    
    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {
        
        // Create The Alert
        let alertInvalid = UIAlertController(title: "Invalid", message: "Must Provide First and Last Name.", preferredStyle: UIAlertControllerStyle.Alert)

        
        if firstName.text?.isEmpty != false {
            
            // add an action (button)
            alertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alertInvalid, animated: true, completion: nil)
            
            
            } else if lastName.text?.isEmpty != false {
                // add an action (button)
                alertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
                // show the alert
                self.presentViewController(alertInvalid, animated: true, completion: nil)
            
            } else {
                let nameDefaults = NSUserDefaults.standardUserDefaults()
                nameDefaults.setObject(firstName.text, forKey: "firstName")
                nameDefaults.setObject(lastName.text, forKey: "lastName")
                nameDefaults.synchronize()
                if let firstname = nameDefaults.stringForKey("firstName") {
                    print(firstname)
                }
                if let lastName = nameDefaults.stringForKey("lastName") {
                    print(lastName)
                }

            }
    
        }
}





