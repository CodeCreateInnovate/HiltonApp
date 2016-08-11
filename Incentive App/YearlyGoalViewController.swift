//
//  YearlyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class YearlyGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    var yearlyDataHundreds : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Yearly Goal"
        self.textField.delegate = self
        
        // Settng The Picker
        
        let yearlyPicker = UIPickerView()
        textField.inputView = yearlyPicker
        yearlyPicker.delegate = self
        yearlyPicker.dataSource = self
        yearlyPicker.backgroundColor = UIColor.whiteColor()
        yearlyPicker.showsSelectionIndicator = true

        //Setting PickerView Range
        var count = 0
        while count <= 20000 {
            yearlyDataHundreds.append(count)
            count += 100
        }

        //Set Toolbar for Picker
        
        let toolBar = UIToolbar()
        textField.inputAccessoryView = toolBar
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor.blackColor()
        toolBar.sizeToFit()
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(YearlyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(YearlyGoalViewController.cancelPicker))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.userInteractionEnabled = true
   
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return yearlyDataHundreds.count
   
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

            return "\(yearlyDataHundreds[row])"
    }
    
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            textField.text = "\(yearlyDataHundreds[row])"

            
    }
    

    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {

        
        //Create Alert
        let yearlyAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Yearly Goal", preferredStyle: UIAlertControllerStyle.Alert)
        
        if textField.text?.isEmpty != false {
            yearlyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(yearlyAlertInvalid, animated: true, completion: nil)
        } else {
            //Save The Data to NSUserDefaults
            
            let yGoal = NSUserDefaults.standardUserDefaults()
            yGoal.setObject(textField.text, forKey: "yearlyGoal")
            NSUserDefaults.standardUserDefaults().synchronize()
            print(yGoal)
        }

    }
    
    func donePicker() {
        
        self.textField.resignFirstResponder()
        
        
    }
    
    func cancelPicker() {
        self.textField.resignFirstResponder()
    }


}



