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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool     {
        self.firstName.resignFirstResponder()
        self.lastName.resignFirstResponder()
        return true
    }
    
    
    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {
        
        // Create The Alert
        let alertInvalid = UIAlertController(title: "Invalid", message: "Must Provide First and Last Name.", preferredStyle: UIAlertControllerStyle.alert)

        
        if firstName.text?.isEmpty != false {
            
            // add an action (button)
            alertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alertInvalid, animated: true, completion: nil)
            
            
            } else if lastName.text?.isEmpty != false {
                // add an action (button)
                alertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
                // show the alert
                self.present(alertInvalid, animated: true, completion: nil)
            
            } else {
                let nameDefaults = UserDefaults.standard
                nameDefaults.set(firstName.text, forKey: "firstName")
                nameDefaults.set(lastName.text, forKey: "lastName")
                nameDefaults.synchronize()
                if let firstname = nameDefaults.string(forKey: "firstName") {
                    print(firstname)
                }
                if let lastName = nameDefaults.string(forKey: "lastName") {
                    print(lastName)
                    
                }
                self.performSegue(withIdentifier: "DailyGoalVC", sender: nil)
            
            

            }
    
        }
}





