//
//  DailyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class DailyGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var dailyTextField: UITextField!
    var dailyDataHundreds : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        dailyTextField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Daily Goal"
        self.dailyTextField.delegate = self
        


        //Setting the Picker
        let dailyPicker = UIPickerView()
        dailyTextField.inputView = dailyPicker
        dailyPicker.delegate = self
        dailyPicker.dataSource = self
        dailyPicker.backgroundColor = UIColor.white
        dailyPicker.showsSelectionIndicator = true
        
        //Setting PickerView Range
        var count = 0
        while count <= 200 {
            dailyDataHundreds.append(count)
            count += 1
        }
        
        //Set Toolbar for Picker
        
        let dailyToolBar = UIToolbar()
        dailyTextField.inputAccessoryView = dailyToolBar
        dailyToolBar.barStyle = UIBarStyle.default
        dailyToolBar.isTranslucent = true
        dailyToolBar.tintColor = UIColor.white
        dailyToolBar.sizeToFit()
        dailyToolBar.barTintColor = UIColor.black
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DailyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DailyGoalViewController.cancelPicker))
        
        dailyToolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        dailyToolBar.isUserInteractionEnabled = true
        
    }
    
    //Helper Methods for Pickerview Toolbar
    
    func donePicker() {
        
        view.endEditing(true)
//        self.dailyTextField.resignFirstResponder()
    }
    
    func cancelPicker() {
        
        view.endEditing(true)
//        self.dailyTextField.resignFirstResponder()
    }

    
    
    //Creates Layout for Picker View ********************************************************
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dailyDataHundreds.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
            return "\(dailyDataHundreds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        dailyTextField.text = "\(dailyDataHundreds[row])"

    }
    

    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    
    @IBAction func saveBtn(sender: AnyObject) {
        
        // Alert For Error Handling and Checks of Text Field
        
        let dailyAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Daily Goal", preferredStyle: UIAlertControllerStyle.alert)
        
        if dailyTextField.text?.isEmpty != false {
            dailyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(dailyAlertInvalid, animated: true, completion: nil)
        } else {
            //Save The Data
            let dGoal = UserDefaults.standard
            dGoal.set(dailyTextField.text, forKey: "dailyGoal")
            UserDefaults.standard.synchronize()
            print(dGoal)
            
        }
        self.performSegue(withIdentifier: "MonthlyGoalVC", sender: nil)
    }
}






