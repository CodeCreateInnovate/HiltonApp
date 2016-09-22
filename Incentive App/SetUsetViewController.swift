//
//  SetUsetViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit



class SetUsetViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var timeText: UITextField!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var youHave: UILabel!
    @IBOutlet weak var remainingTime: UILabel!


        
        //  Dictionary to Store Values of Set and Uset Time
    var setUset: [Double: String] = [
        
        0.00 : "0",
        0.01 : "1",
        0.02 : "1",
        0.03 : "2",
        0.04 : "2",
        0.05 : "3",
        0.06 : "3",
        0.07 : "4",
        0.08 : "5",
        0.09 : "5",
        0.10 : "6",
        0.11 : "6",
        0.12 : "7",
        0.13 : "8",
        0.14 : "8",
        0.15 : "9",
        0.16 : "9",
        0.17 : "10",
        0.18 : "11",
        0.19 : "11",
        0.20 : "12",
        0.21 : "12",
        0.22 : "13",
        0.23 : "14",
        0.24 : "14",
        0.25 : "15",
        0.26 : "15",
        0.27 : "16",
        0.28 : "17",
        0.29 : "17",
        0.30 : "18",
        0.31 : "18",
        0.32 : "19",
        0.33 : "20",
        0.34 : "20",
        0.35 : "21",
        0.36 : "21",
        0.37 : "22",
        0.38 : "23",
        0.39 : "23",
        0.40 : "24",
        0.41 : "24",
        0.42 : "25",
        0.43 : "26",
        0.44 : "26",
        0.45 : "27",
        0.46 : "27",
        0.47 : "28",
        0.48 : "29",
        0.49 : "29",
        0.50 : "30",
        0.51 : "30",
        0.52 : "31",
        0.53 : "32",
        0.54 : "32",
        0.55 : "33",
        0.56 : "34",
        0.57 : "34",
        0.58 : "35",
        0.59 : "35",
        0.60 : "36",
        0.61 : "36",
        0.62 : "37",
        0.63 : "38",
        0.64 : "38",
        0.65 : "39",
        0.66 : "39",
        0.67 : "40",
        0.68 : "41",
        0.69 : "41",
        0.70 : "42",
        0.71 : "41",
        0.72 : "43",
        0.73 : "44",
        0.74 : "44",
        0.75 : "45",
        0.76 : "45",
        0.77 : "46",
        0.78 : "47",
        0.79 : "47",
        0.80 : "48",
        0.81 : "48",
        0.82 : "49",
        0.83 : "50",
        0.84 : "50",
        0.85 : "51",
        0.86 : "51",
        0.87 : "52",
        0.88 : "53",
        0.89 : "53",
        0.90 : "54",
        0.91 : "54",
        0.92 : "55",
        0.93 : "56",
        0.94 : "56",
        0.95 : "57",
        0.96 : "57",
        0.97 : "58",
        0.98 : "59",
        0.99 : "59"]

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        timeText.resignFirstResponder()
        return true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Class Driven Functions
        
        timeText.underlined()
        textFieldShouldReturn(textField: timeText)
        hideKeyboardWhenTappedAround()
        self.navigationItem.title = "Set-Uset Calculator"
        
        //Reveal Controller
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    
    //Helper Method To Split String, Compare To Dictionary and Print Text
    
    func splitString() {
        let time = Double(timeText.text!)
        let split = modf(time!)
        let roundTwoPlaces1 = Int(split.0)
        let roundTwoPlaces2 = round(100.0 * split.1) / 100.0
        
        if setUset[roundTwoPlaces2] != nil {
            youHave.text = "You Have"
            timeLbl.text = "\(roundTwoPlaces1) Hours and \(setUset[roundTwoPlaces2]!) Minutes "
            remainingTime.text = "of SET / USET Time Remaining."
            
        } else {
            timeLbl.text = "PLEASE ENTER A VALID VALUE (IE. 3.93)"
        }
        
    }
    
    //Submit Button With Alerts For Error Handling
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        
        splitString()
        
        let setAlertInvalid = UIAlertController(title: "Invalid", message: "Please Enter Set or Uset Time", preferredStyle: UIAlertControllerStyle.alert)
        
        if timeText.text?.isEmpty != false {
            setAlertInvalid.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(setAlertInvalid, animated: true, completion: nil)
        } else {
            textFieldShouldReturn(textField: timeText)
            print("Thank You!")
        }
    }
    
    
}






