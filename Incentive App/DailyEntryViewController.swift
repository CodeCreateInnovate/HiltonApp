//
//  DailyEntryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class DailyEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var hgvXfers: UITextField!
    @IBOutlet weak var ehiXfers: UITextField!
    @IBOutlet weak var callsTaken: UITextField!
    @IBOutlet weak var enterDate: UITextField!
    var datePicker : UIDatePicker!
    
    var dailyHgv : [Int] = []
    var dailyEhi : [Int] = []
    var dailyCalls : [Int] = []
    var date : [NSDate] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hgvXfers.underlined()
        ehiXfers.underlined()
        callsTaken.underlined()
        enterDate.underlined()
        hideKeyboardWhenTappedAround()
        textFieldShouldReturn(enterDate)
        
        
        
        self.navigationItem.title = "Daily Entry"
        self.enterDate.delegate = self
        
        
        //Create ToolBar For DatePicker
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor.blackColor()
        toolBar.sizeToFit()
        
        // Create Buttons on Toolbar
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(DailyGoalViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(DailyGoalViewController.cancelPicker))
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        self.enterDate.inputAccessoryView = toolBar
   
        
//***********************************************************************************

   
    
    // Reveal View Comtroller

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    //Function to Know when TextField has been touched and to initiate Date Picker
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.getDate(self.enterDate)
    }

    // Function to start date picker and save the text into the textfield.
    func getDate(textField : UITextField) {
        self.datePicker = UIDatePicker(frame: CGRectMake(0,0,self.view.frame.size.width, 216))
        self.datePicker.backgroundColor = UIColor.whiteColor()
        self.datePicker.datePickerMode = UIDatePickerMode.Date
        textField.inputView = self.datePicker
    }
    

     // Do any additional setup after loading the view.
    
    @IBAction func submitBtn(sender: AnyObject) {
        
        // Alert For Error Handling and Checks of Text Field
        
        let hgvAlertInvalid = UIAlertController(title: "Invalid", message: "HGV Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ehiAlertInvalid = UIAlertController(title: "Invalid", message: "EHI Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.Alert)
        
        let callsAlertInvalid = UIAlertController(title: "Invalid", message: "Calls Taken Must Have a Valid Value", preferredStyle: UIAlertControllerStyle.Alert)
        
        let dateAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Date", preferredStyle: UIAlertControllerStyle.Alert)
        
        if hgvXfers.text?.isEmpty != false {
            
            hgvAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(hgvAlertInvalid, animated: true, completion: nil)
            
            } else if ehiXfers.text?.isEmpty != false {
            
                ehiAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(ehiAlertInvalid, animated: true, completion: nil)
            
            } else if callsTaken.text?.isEmpty != false {
                callsAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(callsAlertInvalid, animated: true, completion: nil)
            
            } else if enterDate.text?.isEmpty != false {
                dateAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(dateAlertInvalid, animated: true, completion: nil)
            } else {
            
            
            
            
            
            //Save The Data
            let dailyDefaults = NSUserDefaults.standardUserDefaults()
            dailyDefaults.setObject(hgvXfers.text, forKey: "hgvXfers")
            dailyDefaults.setObject(ehiXfers.text, forKey: "ehiXfers")
            dailyDefaults.setObject(callsTaken.text, forKey: "callsTaken")
            dailyDefaults.setObject(enterDate.text, forKey: "date")
            dailyDefaults.synchronize()
            
            if let hgvData = dailyDefaults.stringForKey("hgvXfers") {
                print(hgvData)
            }
            
            if let ehiData = dailyDefaults.stringForKey("ehiXfers") {
                print(ehiData)
            }
            
            if let callsData = dailyDefaults.stringForKey("callsTaken") {
                print(callsData)
            }
            
            if let dateData = dailyDefaults.stringForKey("date") {
                print(dateData)
            } else {
                dailyDefaults.setObject("Something is Wrong", forKey: "Wrong")
                print("Something is Empty")
                }
            
            }
        }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.enterDate.resignFirstResponder()
        return true
    }
    
    func donePicker() {
        let dateFormatter1 = NSDateFormatter()
        dateFormatter1.dateStyle = .MediumStyle
        dateFormatter1.timeStyle = .NoStyle
        enterDate.text = dateFormatter1.stringFromDate(datePicker.date)
        enterDate.resignFirstResponder()
    }

    func cancelPicker() {
        enterDate.resignFirstResponder()
    }

}



