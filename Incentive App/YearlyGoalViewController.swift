//
//  YearlyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class YearlyGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var yearlyTextField: UITextField!
    var yearlyDataHundreds : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        yearlyTextField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Yearly Goal"
        self.yearlyTextField.delegate = self
        
        // Settng The Picker
        
        let yearlyPicker = UIPickerView()
        yearlyTextField.inputView = yearlyPicker
        yearlyPicker.delegate = self
        yearlyPicker.dataSource = self
        yearlyPicker.backgroundColor = UIColor.white
        yearlyPicker.showsSelectionIndicator = true

        //Setting PickerView Range
        var count = 0
        while count <= 20000 {
            yearlyDataHundreds.append(count)
            count += 100
        }

        //Set Toolbar for Picker
        
        let yearlyToolBar = UIToolbar()
        yearlyTextField.inputAccessoryView = yearlyToolBar
        yearlyToolBar.barStyle = UIBarStyle.default
        yearlyToolBar.isTranslucent = true
        yearlyToolBar.tintColor = UIColor.white
        yearlyToolBar.sizeToFit()
        yearlyToolBar.barTintColor = UIColor.black
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(YearlyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(YearlyGoalViewController.cancelPicker))
        
        yearlyToolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        yearlyToolBar.isUserInteractionEnabled = true
   
    }
    
    
    func donePicker() {
        
        self.yearlyTextField.resignFirstResponder()
        
        
    }
    
    func cancelPicker() {
        self.yearlyTextField.resignFirstResponder()
    }
    
    
    //Set The PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return yearlyDataHundreds.count
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return "\(yearlyDataHundreds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        yearlyTextField.text = "\(yearlyDataHundreds[row])"
            
    }

    

    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {

        
        //Create Alert
        let yearlyAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Yearly Goal", preferredStyle: UIAlertControllerStyle.alert)
        
        if yearlyTextField.text?.isEmpty != false {
            yearlyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(yearlyAlertInvalid, animated: true, completion: nil)
        } else {
            //Save The Data to NSUserDefaults
            
            let yGoal = UserDefaults.standard
            yGoal.set(yearlyTextField.text, forKey: "yearlyGoal")
            UserDefaults.standard.synchronize()
            print(yGoal)
        }
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let frontVC  = storyboard.instantiateViewController(withIdentifier: "dailyEntry") as! DailyEntryViewController
        let rearVC = storyboard.instantiateViewController(withIdentifier: "BackTableVC") as! BackTableVC
        
        let frontNav = UINavigationController(rootViewController: frontVC)
        let rearNav = UINavigationController(rootViewController: rearVC)
        
        let revealControl = SWRevealViewController(rearViewController: rearNav, frontViewController: frontNav)

        self.present(revealControl!, animated: true, completion: nil)
    }
}





