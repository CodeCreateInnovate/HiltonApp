//
//  DailyEntryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

//Arrays to hold Daily Entries
class DailyEntryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var hgvXfers: UITextField!
    @IBOutlet weak var ehiXfers: UITextField!
    @IBOutlet weak var callsTaken: UITextField!
    @IBOutlet weak var enterDate: UITextField!
    var datePicker : UIDatePicker!
    
    var date : [NSDate] = []
    
//    var data = [DailyEntryData]()
    
    var dailyEntryHGV : [Int] = []
    var dailyEntryEHI : [Int] = []
    var dailyEntryCalls : [Int] = []
    
    var hgvTotal = 0
    var ehiTotal = 0
    var callsTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set PickerViews For Each TextField
        
        //Setting the HGV Picker
        let hgvPicker = UIPickerView()
        hgvXfers.inputView = hgvPicker
        hgvPicker.delegate = self
        hgvPicker.dataSource = self
        hgvPicker.backgroundColor = UIColor.white
        hgvPicker.showsSelectionIndicator = true
        hgvPicker.tag = 0
        
        //Setting PickerView Range
        var hgvCount = 0
        while hgvCount <= 200 {
            dailyEntryHGV.append(hgvCount)
            hgvCount += 1
        }

        
        //Setting the EHI Picker
        let ehiPicker = UIPickerView()
        ehiXfers.inputView = ehiPicker
        ehiPicker.delegate = self
        ehiPicker.dataSource = self
        ehiPicker.backgroundColor = UIColor.white
        ehiPicker.showsSelectionIndicator = true
        ehiPicker.tag = 1
        
        
        //Setting PickerView Range
        var ehiCount = 0
        while ehiCount <= 200 {
            dailyEntryEHI.append(ehiCount)
            ehiCount += 1
        }
        
        
        
        //Setting the HGV Picker
        let callsPicker = UIPickerView()
        callsTaken.inputView = callsPicker
        callsPicker.delegate = self
        callsPicker.dataSource = self
        callsPicker.backgroundColor = UIColor.white
        callsPicker.showsSelectionIndicator = true
        callsPicker.tag = 2
        
        
        //Setting PickerView Range
        var callsCount = 0
        while callsCount <= 200 {
            dailyEntryCalls.append(callsCount)
            callsCount += 1
        }

        

        hgvXfers.underlined()
        ehiXfers.underlined()
        callsTaken.underlined()
        enterDate.underlined()
        hideKeyboardWhenTappedAround()
        
        self.navigationItem.title = "Daily Entry"
        self.enterDate.delegate = self
        self.hgvXfers.delegate = self
        self.ehiXfers.delegate = self
        self.callsTaken.delegate = self
        
        //Create ToolBar For DatePicker
        let toolBar = UIToolbar()
        self.enterDate.inputAccessoryView = toolBar
        self.hgvXfers.inputAccessoryView = toolBar
        self.ehiXfers.inputAccessoryView = toolBar
        self.callsTaken.inputAccessoryView = toolBar
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.barTintColor = UIColor.black
        toolBar.sizeToFit()
        toolBar.tintColor = UIColor.white
        
        // Create Buttons on Toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DailyEntryViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(DailyEntryViewController.cancelPicker))
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
   
        
//***********************************************************************************

    // Reveal View Comtroller
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    
    
    
    //    //Creates Layout for HGV Picker View ********************************************************
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
           return dailyEntryHGV.count
        } else if pickerView.tag == 1 {
           return dailyEntryEHI.count
        } else if pickerView.tag == 2 {
           return dailyEntryCalls.count
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return "\(dailyEntryHGV[row])"
        } else if pickerView.tag == 1 {
            return "\(dailyEntryEHI[row])"
        } else if pickerView.tag == 2 {
            return "\(dailyEntryCalls[row])"
        }
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            hgvXfers.text = "\(dailyEntryHGV[row])"
        } else if pickerView.tag == 1 {
            ehiXfers.text = "\(dailyEntryEHI[row])"
        } else if pickerView.tag == 2 {
            callsTaken.text = "\(dailyEntryCalls[row])"
        }
    }
        
    
    
    
 //***********************************************************************************
  
    
    //Function to Know when TextField has been touched and to initiate Date Picker
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.getDate(textField: self.enterDate)
    }

    // Function to start date picker and save the text into the textfield.
    func getDate(textField : UITextField) {
        self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        
    }
    

     //    Submit Button     ***************************************************
    
    @IBAction func submitBtn(sender: AnyObject) {
        
        // Alert For Error Handling and Checks of Text Field
        
        let hgvAlertInvalid = UIAlertController(title: "Invalid", message: "HGV Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.alert)
        let ehiAlertInvalid = UIAlertController(title: "Invalid", message: "EHI Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.alert)
        let callsAlertInvalid = UIAlertController(title: "Invalid", message: "Calls Taken Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.alert)
        let dateAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Date", preferredStyle: UIAlertControllerStyle.alert)
        
        if hgvXfers.text?.isEmpty != false {
            hgvAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(hgvAlertInvalid, animated: true, completion: nil)
            } else if ehiXfers.text?.isEmpty != false {
                ehiAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(ehiAlertInvalid, animated: true, completion: nil)

            } else if callsTaken.text?.isEmpty != false {
                callsAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(callsAlertInvalid, animated: true, completion: nil)
            
            } else if enterDate.text?.isEmpty != false {
                dateAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(dateAlertInvalid, animated: true, completion: nil)
            } else {
            //Convert Text To An Int
            let dailyHgv = Int(hgvXfers.text!)
            let dailyEhi = Int(ehiXfers.text!)
            let dailyCalls = Int(callsTaken.text!)
        
            
            
            //Add Daily Entries to Current Totals.
            hgvTotal = hgvTotal + dailyHgv!
            ehiTotal = ehiTotal + dailyEhi!
            callsTotal = callsTotal + dailyCalls!
            
            let dailyEntryDefaults = UserDefaults.standard
            dailyEntryDefaults.set(hgvTotal, forKey: "hgvTotal")
            dailyEntryDefaults.set(ehiTotal, forKey: "ehiTotal")
            dailyEntryDefaults.set(callsTotal, forKey: "totalCalls")
            dailyEntryDefaults.synchronize()
            
            if let hgv = dailyEntryDefaults.string(forKey: "hgvTotal") {
                print(hgv)
            }
            if let ehi = dailyEntryDefaults.string(forKey: "ehiTotal") {
                print(ehi)
            }
            if let calls = dailyEntryDefaults.string(forKey: "totalCalls") {
                print(calls)
            }

            
            
            //Empty Strings to clear Text Fields
            
            hgvXfers.text = ""
            ehiXfers.text = ""
            callsTaken.text = ""
            enterDate.text = ""

        }

    }

    
    func donePicker() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        enterDate.text = dateFormatter1.string(from: datePicker.date)
        enterDate.resignFirstResponder()
        hgvXfers.resignFirstResponder()
        ehiXfers.resignFirstResponder()
        callsTaken.resignFirstResponder()
        
    }

    func cancelPicker() {
        hgvXfers.resignFirstResponder()
        ehiXfers.resignFirstResponder()
        callsTaken.resignFirstResponder()
        enterDate.resignFirstResponder()
    }
    

}


