//
//  MonthlyGoalViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/7/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class MonthlyGoalViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var monthlyTextField: UITextField!
    var monthlyDataHundreds : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        monthlyTextField.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Monthly Goal"
        self.monthlyTextField.delegate = self
        
        
        //Setting the Picker
        
        let monthlyPicker = UIPickerView()
        monthlyTextField.inputView = monthlyPicker
        monthlyPicker.delegate = self
        monthlyPicker.dataSource = self
        monthlyPicker.backgroundColor = UIColor.white
        monthlyPicker.showsSelectionIndicator = true
        
        //Setting PickerView Range
        var count = 0
        while count <= 2000  {
            monthlyDataHundreds.append(count)
            count += 50
        }
        
        //Set Toolbar for Picker
        
        let monthlyToolBar = UIToolbar()
        monthlyTextField.inputAccessoryView = monthlyToolBar
        monthlyToolBar.barStyle = UIBarStyle.default
        monthlyToolBar.isTranslucent = true
        monthlyToolBar.tintColor = UIColor.white
        monthlyToolBar.sizeToFit()
        monthlyToolBar.barTintColor = UIColor.black
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MonthlyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(MonthlyGoalViewController.cancelPicker))
        
        monthlyToolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        monthlyToolBar.isUserInteractionEnabled = true
    }
    
    func donePicker() {
        
        view.endEditing(true)
//        self.monthlyTextField.resignFirstResponder()
    }
    
    func cancelPicker() {
        view.endEditing(true)
//        self.monthlyTextField.resignFirstResponder()
    }
    
    
    
    //Creates Layout For Pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monthlyDataHundreds.count
    }
    

 
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(monthlyDataHundreds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        monthlyTextField.text = "\(monthlyDataHundreds[row])"

    }
    


    
    
    // Save Button that Holds Alerts For Checking Validity of Text Fields
    @IBAction func saveBtn(sender: AnyObject) {

        // Error Check and Alert to See if TextField Is Empty
        
         let monthlyAlertInvalid = UIAlertController(title: "Invalid", message: "Must Provide Monthly Goal", preferredStyle: UIAlertControllerStyle.alert)
        
        if monthlyTextField.text?.isEmpty != false {
            monthlyAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(monthlyAlertInvalid, animated: true, completion: nil)
            
        } else {
                let mGoal = UserDefaults.standard
            mGoal.set(monthlyTextField.text, forKey: "monthlyGoal")
            UserDefaults.standard.synchronize()
            print(mGoal)
            
        }
        self.performSegue(withIdentifier: "YearlyGoalVC", sender: nil)
    }
}






