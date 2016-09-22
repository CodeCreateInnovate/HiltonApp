//
//  DailyEntryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

//Arrays to hold Daily Entries
class DailyEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var hgvXfers: UITextField!
    @IBOutlet weak var ehiXfers: UITextField!
    @IBOutlet weak var callsTaken: UITextField!
    @IBOutlet weak var enterDate: UITextField!
    var datePicker : UIDatePicker!
    
    var date : [NSDate] = []
    
//    var data = [DailyEntryData]()
    
//    var dailyEntryHGV = [Int]()
//    var dailyEntryEHI = [Int]()
//    var dailyEntryCalls = [Int]()
    
    var hgvTotal = 0
    var ehiTotal = 0
    var callsTotal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        

        hgvXfers.underlined()
        ehiXfers.underlined()
        callsTaken.underlined()
        enterDate.underlined()
        hideKeyboardWhenTappedAround()
        textFieldShouldReturn(textField: enterDate)
        
        self.navigationItem.title = "Daily Entry"
        self.enterDate.delegate = self
        
        //Create ToolBar For DatePicker
        let toolBar = UIToolbar()
        
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
    

     // Do any additional setup after loading the view.
    
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
            
//            // Create Data Object
//            let dataOne = DailyEntryData(hgvFinal: dailyHgv!, ehiFinal: dailyEhi!, callsFinal: dailyCalls!)
//            
//            data.append(dataOne)
//            
//            let dataData = NSKeyedArchiver.archivedDataWithRootObject(data)
//            dailyEntryHGV.append(dailyHgv!)
//            dailyEntryEHI.append(dailyEhi!)
//            dailyEntryCalls.append(dailyCalls!)

            
            
            //Save Data in Arrays To User Defaults
//            let dailyDefaults = NSUserDefaults.standardUserDefaults()
//            dailyDefaults.setObject(dataData, forKey: "data")
//            dailyDefaults.synchronize()
            
//            if let loadedData = NSUserDefaults.standardUserDefaults().objectForKey("data") as? NSData {
//                if let dataArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadedData) as? [DailyEntryData] {
//                    for myData in dataArray {
//                        print(myData.hgv)
//                        print(myData.ehi)
//                        print(myData.calls)
//
//
//                    }
//                }
//            }
            
            
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
    }

    func cancelPicker() {
        enterDate.resignFirstResponder()
    }

}



