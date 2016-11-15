//
//  AccountViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AccountViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, GADBannerViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var editFirstName: UITextField!
    @IBOutlet weak var editLastName: UITextField!
    @IBOutlet weak var editDailyGoal: UITextField!
    @IBOutlet weak var editMonthlyGoal: UITextField!
    @IBOutlet weak var editYearlyGoal: UITextField!
    
    
    @IBOutlet weak var banner: GADBannerView!

    //Arrays To Hold Counts For Pickers
    var daily : [Int] = []
    var monthly : [Int] = []
    var yearly : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.delegate = self
        banner.adUnitID = "ca-app-pub-2847938944264018/1848681686"
        banner.rootViewController = self
        banner.load(GADRequest())
    
        //Function Calls
        
        
        editFirstName.underlined()
        editLastName.underlined()
        editDailyGoal.underlined()
        editMonthlyGoal.underlined()
        editYearlyGoal.underlined()
        hideKeyboardWhenTappedAround()



        
        self.navigationItem.title = "Account Info"
        
        
        //Reveal View Controller
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        //Load The Data
        let dGoal = UserDefaults.standard
        if let dlyGoal = dGoal.string(forKey: "dailyGoal") {
            editDailyGoal.text = (dlyGoal)
        }

        
        let mGoal = UserDefaults.standard
        if let monGoal = mGoal.string(forKey: "monthlyGoal") {
            editMonthlyGoal.text = (monGoal)
        }
        
        let yGoal = UserDefaults.standard
        if let yearGoal = yGoal.string(forKey: "yearlyGoal") {
            editYearlyGoal.text = (yearGoal)
        }
    
        
        let nameDefaults = UserDefaults.standard
        nameDefaults.synchronize()
        
        if let firstname = nameDefaults.string(forKey: "firstName") {
            editFirstName.text = (firstname)
        }
        if let lastName = nameDefaults.string(forKey: "lastName") {
            editLastName.text = (lastName)
            
        }

        self.editFirstName.delegate = self
        self.editLastName.delegate = self
        self.editDailyGoal.delegate = self
        self.editMonthlyGoal.delegate = self
        self.editYearlyGoal.delegate = self
        

        
        let dailyPicker = UIPickerView()
        let monthlyPicker = UIPickerView()
        let yearlyPicker = UIPickerView()
        editDailyGoal.inputView = dailyPicker
        editMonthlyGoal.inputView = monthlyPicker
        editYearlyGoal.inputView = yearlyPicker
        
        dailyPicker.delegate = self
        dailyPicker.dataSource = self
        monthlyPicker.delegate = self
        monthlyPicker.dataSource = self
        yearlyPicker.delegate = self
        yearlyPicker.dataSource = self
        
        dailyPicker.tag = 0
        monthlyPicker.tag = 1
        yearlyPicker.tag = 2

        
        
        
        //Setting PickerView Range
        var dailyCount = 0
        while dailyCount <= 200 {
            daily.append(dailyCount)
            dailyCount += 1
        }
        
        var monthlyCount = 0
        while monthlyCount <= 2000 {
            monthly.append(monthlyCount)
            monthlyCount += 50
        }
        
        var yearlyCount = 0
        while yearlyCount <= 20000 {
            yearly.append(yearlyCount)
            yearlyCount += 100
        }
        

        
        //Set Toolbar for Picker
        
        let toolBar = UIToolbar()
        editDailyGoal.inputAccessoryView = toolBar
        editMonthlyGoal.inputAccessoryView = toolBar
        editYearlyGoal.inputAccessoryView = toolBar
        editFirstName.inputAccessoryView = toolBar
        editLastName.inputAccessoryView = toolBar
        
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.white
        toolBar.sizeToFit()
        toolBar.barTintColor = UIColor.black
        
        
        //Creating Toolbar Options
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AccountViewController.donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AccountViewController.cancelPicker))
        
        toolBar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
    }
    
    //Helper Methods for Pickerview Toolbar
    
    func donePicker() {
        view.endEditing(true)

    }
    
    func cancelPicker() {
        view.endEditing(true)

    }
    
    
    
    
    //Creates Layout for  Daily Picker View ********************************************************
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return daily.count
        } else if pickerView.tag == 1 {
            return monthly.count
        } else {
            pickerView.tag = 2
            return yearly.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return "\(daily[row])"
        } else if pickerView.tag == 1 {
            return "\(monthly[row])"
        } else {
            pickerView.tag = 2
            return "\(yearly[row])"
        }
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            editDailyGoal.text = "\(daily[row])"
        } else if pickerView.tag == 1 {
            editMonthlyGoal.text = "\(monthly[row])"
        } else {
            pickerView.tag = 2
            editYearlyGoal.text = "\(yearly[row])"
        }
 
        
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        let goalsUpdate = UIAlertController(title: "Thank You", message: "Your Account Info Has Been Updated", preferredStyle: UIAlertControllerStyle.alert)
        goalsUpdate.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(goalsUpdate, animated: true, completion: nil)

        let nameDefaults = UserDefaults.standard
        let dGoal = UserDefaults.standard
        let mGoal = UserDefaults.standard
        let yGoal = UserDefaults.standard
        
        
        nameDefaults.set(editFirstName.text, forKey: "firstName")
        nameDefaults.set(editLastName.text, forKey: "lastName")
        dGoal.set(editDailyGoal.text, forKey: "dailyGoal")
        mGoal.set(editMonthlyGoal.text, forKey: "monthlyGoal")
        yGoal.set(editYearlyGoal.text, forKey: "yearlyGoal")
        
        nameDefaults.synchronize()
        dGoal.synchronize()
        mGoal.synchronize()
        yGoal.synchronize()
        
        if let firstName = nameDefaults.string(forKey: "firstName") {
            print(firstName)
        }
        if let lastName = nameDefaults.string(forKey: "lastName") {
            print(lastName)
        }
        if let newDailyGoal = dGoal.string(forKey: "dailyGoal") {
            print(newDailyGoal)
        }
        if let newMonthlyGoal = mGoal.string(forKey: "monthlyGoal") {
            print(newMonthlyGoal)
        }
        if let newYearlyGoal = yGoal.string(forKey: "yearlyGoal") {
            print(newYearlyGoal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editFirstName.resignFirstResponder()
        editLastName.resignFirstResponder()
        editDailyGoal.resignFirstResponder()
        editMonthlyGoal.resignFirstResponder()
        editYearlyGoal.resignFirstResponder()
        return true
    }
    
}






