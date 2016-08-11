//
//  MonthlyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class MonthlyGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    var monthlyDataHundreds : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        textField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Monthly Goal"
        self.textField.delegate = self
        
        
        //Setting the Picker
        
        let monthlyPicker = UIPickerView()
        textField.inputView = monthlyPicker
        monthlyPicker.delegate = self
        monthlyPicker.dataSource = self
        monthlyPicker.backgroundColor = UIColor.whiteColor()
        monthlyPicker.showsSelectionIndicator = true
        
        //Setting PickerView Range
        var count = 0
        while count <= 2000  {
            monthlyDataHundreds.append(count)
            count += 50
        }
        
        //Set Toolbar for Picker
        
        let toolBar = UIToolbar()
        textField.inputAccessoryView = toolBar
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor.blackColor()
        toolBar.sizeToFit()
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MonthlyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MonthlyGoalViewController.cancelPicker))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.userInteractionEnabled = true
    }
    
    
    
    
    
    //Creates Layout For Pickerview
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return monthlyDataHundreds.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(monthlyDataHundreds[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = "\(monthlyDataHundreds[row])"

    }
    
    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {

        // Error Check and Alert to See if TextField Is Empty
        
         let monthlyAlertInvalid = UIAlertController(title: "Invalid", message: "Must Provide Monthly Goal", preferredStyle: UIAlertControllerStyle.Alert)
        
        if textField.text?.isEmpty != false {
            monthlyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(monthlyAlertInvalid, animated: true, completion: nil)
            
        } else {
                let mGoal = NSUserDefaults.standardUserDefaults()
            mGoal.setObject(textField.text, forKey: "monthlyGoal")
            NSUserDefaults.standardUserDefaults().synchronize()
            print(mGoal)
        }

    }
    
    //Helper Methods for Pickerview Toolbar
    
    
    func donePicker() {
        
        self.textField.resignFirstResponder()
    }
    
    func cancelPicker() {
        self.textField.resignFirstResponder()
    }
    

}






