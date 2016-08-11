//
//  DailyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class DailyGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    var dailyDataHundreds : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        textField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Daily Goal"
        self.textField.delegate = self
        


        //Setting the Picker
        let dailyPicker = UIPickerView()
        textField.inputView = dailyPicker
        dailyPicker.delegate = self
        dailyPicker.dataSource = self
        dailyPicker.backgroundColor = UIColor.whiteColor()
        dailyPicker.showsSelectionIndicator = true
        
        //Setting PickerView Range
        var count = 0
        while count <= 200 {
            dailyDataHundreds.append(count)
            count += 1
        }
        
        //Set Toolbar for Picker
        
        let toolBar = UIToolbar()
        textField.inputAccessoryView = toolBar
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor.blackColor()
        toolBar.sizeToFit()
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(DailyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(DailyGoalViewController.cancelPicker))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
    }
    
    
    //Creates Layout for Picker View ********************************************************
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return dailyDataHundreds.count

    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return "\(dailyDataHundreds[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textField.text = "\(dailyDataHundreds[row])"

    }
    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    
    @IBAction func saveBtn(sender: AnyObject) {
        
        // Alert For Error Handling and Checks of Text Field
        
        let dailyAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Daily Goal", preferredStyle: UIAlertControllerStyle.Alert)
        
        if textField.text?.isEmpty != false {
            dailyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(dailyAlertInvalid, animated: true, completion: nil)
        } else {
            //Save The Data
            let dGoal = NSUserDefaults.standardUserDefaults()
            dGoal.setObject(textField.text, forKey: "dailyGoal")
            NSUserDefaults.standardUserDefaults().synchronize()
            print(dGoal)
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






