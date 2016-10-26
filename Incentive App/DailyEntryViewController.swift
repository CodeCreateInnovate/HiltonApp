//
//  DailyEntryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit
import GoogleMobileAds

//Arrays to hold Daily Entries
class DailyEntryViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, GADBannerViewDelegate {
    
    @IBOutlet weak var banner: GADBannerView!
    
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var hgvXfers: UITextField!
    @IBOutlet weak var ehiXfers: UITextField!
    @IBOutlet weak var callsTaken: UITextField!
    @IBOutlet weak var enterDate: UITextField!
    @IBOutlet weak var SubmitBtn: UIButton!
    
    var datePicker : UIDatePicker!
    
    var dailyEntryHGV   : [Int] = []
    var dailyEntryEHI   : [Int] = []
    var dailyEntryCalls : [Int] = []
    

    

    //Set Arrays for Monthly HGV
    var hgvJan : [Int] = []
    var hgvFeb : [Int] = []
    var hgvMar : [Int] = []
    var hgvApr : [Int] = []
    var hgvMay : [Int] = []
    var hgvJun : [Int] = []
    var hgvJul : [Int] = []
    var hgvAug : [Int] = []
    var hgvSep : [Int] = []
    var hgvOct : [Int] = []
    var hgvNov : [Int] = []
    var hgvDec : [Int] = []
    
    //Set Arrays for Monthly EHI
    var ehiJan : [Int] = []
    var ehiFeb : [Int] = []
    var ehiMar : [Int] = []
    var ehiApr : [Int] = []
    var ehiMay : [Int] = []
    var ehiJun : [Int] = []
    var ehiJul : [Int] = []
    var ehiAug : [Int] = []
    var ehiSep : [Int] = []
    var ehiOct : [Int] = []
    var ehiNov : [Int] = []
    var ehiDec : [Int] = []
    
    //Set Arrays for Monthly Calls
    var callsJan : [Int] = []
    var callsFeb : [Int] = []
    var callsMar : [Int] = []
    var callsApr : [Int] = []
    var callsMay : [Int] = []
    var callsJun : [Int] = []
    var callsJul : [Int] = []
    var callsAug : [Int] = []
    var callsSep : [Int] = []
    var callsOct : [Int] = []
    var callsNov : [Int] = []
    var callsDec : [Int] = []
    
    //Set Arrays For Months
    var janDateArray : [String] = []
    var febDateArray : [String] = []
    var marDateArray : [String] = []
    var aprDateArray : [String] = []
    var mayDateArray : [String] = []
    var junDateArray : [String] = []
    var julDateArray : [String] = []
    var augDateArray : [String] = []
    var sepDateArray : [String] = []
    var octDateArray : [String] = []
    var novDateArray : [String] = []
    var decDateArray : [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        banner.delegate = self
        banner.adUnitID = "ca-app-pub-2847938944264018/1848681686"
        banner.rootViewController = self
        banner.load(GADRequest())
        
        
        self.navigationItem.title = "Daily Entry"
        self.enterDate.delegate = self
        self.hgvXfers.delegate = self
        self.ehiXfers.delegate = self
        self.callsTaken.delegate = self
        loadData()
        setPickers()
        hgvXfers.underlined()
        ehiXfers.underlined()
        callsTaken.underlined()
        enterDate.underlined()
        hideKeyboardWhenTappedAround()
        setPickerToolbar()

        

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
            
//            let dailyDataEntered = UIAlertController(title: "Thank You", message: "You Did Great Today", preferredStyle: UIAlertControllerStyle.alert)
//            dailyDataEntered.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(dailyDataEntered, animated: true, completion: nil)
            
            formatDate()
            appendToArrays()
            saveData()


        }

    }
    
    
    
    
    
    //Beginning of Functions
    
    func donePicker() {
        formatDate()
        resignResponder()
        
    }

    func cancelPicker() {
        resignResponder()
    }
    
    
    func formatDate() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        enterDate.text = dateFormatter1.string(from: datePicker.date)
        



    }
    
    func resignResponder() {
        hgvXfers.resignFirstResponder()
        ehiXfers.resignFirstResponder()
        callsTaken.resignFirstResponder()
        enterDate.resignFirstResponder()
    }
    
    func loadData() {
        let dailyEntryDefaults = UserDefaults.standard
        //Load HGV
        print("Begin HGV")
        
        if (dailyEntryDefaults.object(forKey: "janHgvTotal") != nil) {
            hgvJan = dailyEntryDefaults.object(forKey: "janHgvTotal") as! [Int]
            print(hgvJan)
        }
        
        if (dailyEntryDefaults.object(forKey: "febHgvTotal") != nil) {
            hgvFeb = dailyEntryDefaults.object(forKey: "febHgvTotal") as! [Int]
            print(hgvFeb)
        }
        
        if (dailyEntryDefaults.object(forKey: "marHgvTotal") != nil) {
            hgvMar = dailyEntryDefaults.object(forKey: "marHgvTotal") as! [Int]
            print(hgvMar)
        }
        
        if (dailyEntryDefaults.object(forKey: "aprHgvTotal") != nil) {
            hgvApr = dailyEntryDefaults.object(forKey: "aprHgvTotal") as! [Int]
            print(hgvApr)
        }
        
        if (dailyEntryDefaults.object(forKey: "mayHgvTotal") != nil) {
            hgvMay = dailyEntryDefaults.object(forKey: "mayHgvTotal") as! [Int]
            print(hgvMay)
        }
        
        if (dailyEntryDefaults.object(forKey: "junHgvTotal") != nil) {
            hgvJun = dailyEntryDefaults.object(forKey: "junHgvTotal") as! [Int]
            print(hgvJun)
        }
        
        if (dailyEntryDefaults.object(forKey: "julHgvTotal") != nil) {
            hgvJul = dailyEntryDefaults.object(forKey: "julHgvTotal") as! [Int]
            print(hgvJul)
        }
        
        if (dailyEntryDefaults.object(forKey: "augHgvTotal") != nil) {
            hgvAug = dailyEntryDefaults.object(forKey: "augHgvTotal") as! [Int]
            print(hgvAug)
        }
        
        if (dailyEntryDefaults.object(forKey: "sepHgvTotal") != nil) {
            hgvSep = dailyEntryDefaults.object(forKey: "sepHgvTotal") as! [Int]
            print(hgvSep)
        }
        
        if (dailyEntryDefaults.object(forKey: "octHgvTotal") != nil) {
            hgvOct = dailyEntryDefaults.object(forKey: "octHgvTotal") as! [Int]
            print(hgvOct)
        }
        
        if (dailyEntryDefaults.object(forKey: "novHgvTotal") != nil) {
            hgvNov = dailyEntryDefaults.object(forKey: "novHgvTotal") as! [Int]
            print(hgvNov)
        }
        
        if (dailyEntryDefaults.object(forKey: "decHgvTotal") != nil) {
            hgvDec = dailyEntryDefaults.object(forKey: "decHgvTotal") as! [Int]
            print(hgvDec)
        }
        print("End HGV")
        print("Begin EHI")
        
        
        //Load EHI
        if (dailyEntryDefaults.object(forKey: "janEhiTotal") != nil) {
            ehiJan = dailyEntryDefaults.object(forKey: "janEhiTotal") as! [Int]
            print(ehiJan)
        }
        
        if (dailyEntryDefaults.object(forKey: "febEhiTotal") != nil) {
            ehiFeb = dailyEntryDefaults.object(forKey: "febEhiTotal") as! [Int]
            print(ehiFeb)
        }
        
        if (dailyEntryDefaults.object(forKey: "marEhiTotal") != nil) {
            ehiMar = dailyEntryDefaults.object(forKey: "marEhiTotal") as! [Int]
            print(ehiMar)
        }
        
        if (dailyEntryDefaults.object(forKey: "aprEhiTotal") != nil) {
            ehiApr = dailyEntryDefaults.object(forKey: "aprEhiTotal") as! [Int]
            print(ehiApr)
        }
        
        if (dailyEntryDefaults.object(forKey: "mayEhiTotal") != nil) {
            ehiMay = dailyEntryDefaults.object(forKey: "mayEhiTotal") as! [Int]
            print(ehiMay)
        }
        
        if (dailyEntryDefaults.object(forKey: "junEhiTotal") != nil) {
            ehiJun = dailyEntryDefaults.object(forKey: "junEhiTotal") as! [Int]
            print(ehiJun)
        }
        
        if (dailyEntryDefaults.object(forKey: "julEhiTotal") != nil) {
            ehiJul = dailyEntryDefaults.object(forKey: "julEhiTotal") as! [Int]
            print(ehiJul)
        }
        
        if (dailyEntryDefaults.object(forKey: "augEhiTotal") != nil) {
            ehiAug = dailyEntryDefaults.object(forKey: "augEhiTotal") as! [Int]
            print(ehiAug)
        }
        
        if (dailyEntryDefaults.object(forKey: "sepEhiTotal") != nil) {
            ehiSep = dailyEntryDefaults.object(forKey: "sepEhiTotal") as! [Int]
            print(ehiSep)
        }
        
        if (dailyEntryDefaults.object(forKey: "octEhiTotal") != nil) {
            ehiOct = dailyEntryDefaults.object(forKey: "octEhiTotal") as! [Int]
            print(ehiOct)
        }
        
        if (dailyEntryDefaults.object(forKey: "novEhiTotal") != nil) {
            ehiNov = dailyEntryDefaults.object(forKey: "novEhiTotal") as! [Int]
            print(ehiNov)
        }
        
        if (dailyEntryDefaults.object(forKey: "decEhiTotal") != nil) {
            ehiDec = dailyEntryDefaults.object(forKey: "decEhiTotal") as! [Int]
            print(ehiDec)
        }
        
        print("End Ehi")
        print("Begin Calls")
        
        
        
        //Load Calls
        if (dailyEntryDefaults.object(forKey: "janTotalCalls") != nil) {
            callsJan = dailyEntryDefaults.object(forKey: "janTotalCalls") as! [Int]
            print(callsJan)
        }
        
        if (dailyEntryDefaults.object(forKey: "febTotalCalls") != nil) {
            callsFeb = dailyEntryDefaults.object(forKey: "febTotalCalls") as! [Int]
            print(callsFeb)
        }
        
        if (dailyEntryDefaults.object(forKey: "marTotalCalls") != nil) {
            callsMar = dailyEntryDefaults.object(forKey: "marTotalCalls") as! [Int]
            print(callsMar)
        }
        
        if (dailyEntryDefaults.object(forKey: "aprTotalCalls") != nil) {
            callsApr = dailyEntryDefaults.object(forKey: "aprTotalCalls") as! [Int]
            print(callsApr)
        }
        
        if (dailyEntryDefaults.object(forKey: "mayTotalCalls") != nil) {
            callsMay = dailyEntryDefaults.object(forKey: "mayTotalCalls") as! [Int]
            print(callsMay)        }
        
        if (dailyEntryDefaults.object(forKey: "junTotalCalls") != nil) {
            callsJun = dailyEntryDefaults.object(forKey: "junTotalCalls") as! [Int]
            print(callsJun)
        }
        
        if (dailyEntryDefaults.object(forKey: "julTotalCalls") != nil) {
            callsJul = dailyEntryDefaults.object(forKey: "julTotalCalls") as! [Int]
            print(callsJul)
        }
        
        if (dailyEntryDefaults.object(forKey: "augTotalCalls") != nil) {
            callsAug = dailyEntryDefaults.object(forKey: "augTotalCalls") as! [Int]
            print(callsAug)
        }
        
        if (dailyEntryDefaults.object(forKey: "sepTotalCalls") != nil) {
            callsSep = dailyEntryDefaults.object(forKey: "sepTotalCalls") as! [Int]
            print(callsSep)
        }
        
        if (dailyEntryDefaults.object(forKey: "octTotalCalls") != nil) {
            callsOct = dailyEntryDefaults.object(forKey: "octTotalCalls") as! [Int]
            print(callsOct)
        }
        
        if (dailyEntryDefaults.object(forKey: "novTotalCalls") != nil) {
            callsNov = dailyEntryDefaults.object(forKey: "novTotalCalls") as! [Int]
            print(callsNov)
        }
        
        if (dailyEntryDefaults.object(forKey: "decTotalCalls") != nil) {
            callsDec = dailyEntryDefaults.object(forKey: "decTotalCalls") as! [Int]
            print(callsDec)
        }
        
        print("End Calls")
        print("Load Dates")
        
        
        //Load Dates
        if (dailyEntryDefaults.object(forKey: "janDate") != nil) {
            janDateArray = dailyEntryDefaults.object(forKey: "janDate") as! [String]
            print(janDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "febDate") != nil) {
            febDateArray = dailyEntryDefaults.object(forKey: "febDate") as! [String]
            print(febDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "marDate") != nil) {
            marDateArray = dailyEntryDefaults.object(forKey: "marDate") as! [String]
            print(marDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "aprDate") != nil) {
            aprDateArray = dailyEntryDefaults.object(forKey: "aprDate") as! [String]
            print(aprDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "mayDate") != nil) {
            mayDateArray = dailyEntryDefaults.object(forKey: "mayDate") as! [String]
            print(mayDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "junDate") != nil) {
            junDateArray = dailyEntryDefaults.object(forKey: "junDate") as! [String]
            print(junDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "julDate") != nil) {
            julDateArray = dailyEntryDefaults.object(forKey: "julDate") as! [String]
            print(julDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "augDate") != nil) {
            augDateArray = dailyEntryDefaults.object(forKey: "augDate") as! [String]
            print(augDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "sepDate") != nil) {
            sepDateArray = dailyEntryDefaults.object(forKey: "sepDate") as! [String]
            print(sepDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "octDate") != nil) {
            octDateArray = dailyEntryDefaults.object(forKey: "octDate") as! [String]
            print(octDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "novDate") != nil) {
            novDateArray = dailyEntryDefaults.object(forKey: "novDate") as! [String]
            print(novDateArray)
        }
        
        if (dailyEntryDefaults.object(forKey: "decDate") != nil) {
            decDateArray = dailyEntryDefaults.object(forKey: "decDate") as! [String]
            print(decDateArray)
        }
        
        print("End Dates")
        
    }
    
    func appendToArrays() {
        
        //Convert Text To An Int
        let dailyHgv = Int(hgvXfers.text!)
        let dailyEhi = Int(ehiXfers.text!)
        let dailyCalls = Int(callsTaken.text!)
        
        let dateEntered = enterDate.text
        print(dateEntered)
        
        let date = self.datePicker.date
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let components = calendar?.components([.month , .year], from: date as Date)
        let year =  components?.year
        let month = components?.month
        
        
        print(year)
        print(month)
        
        
        if month == 1 {
            if janDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                janDateArray.append(dateEntered!)
                hgvJan.append(dailyHgv!)
                ehiJan.append(dailyEhi!)
                callsJan.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 2 {
            if febDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                febDateArray.append(dateEntered!)
                hgvFeb.append(dailyHgv!)
                ehiFeb.append(dailyEhi!)
                callsFeb.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 3 {
            if marDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                marDateArray.append(dateEntered!)
                hgvMar.append(dailyHgv!)
                ehiMar.append(dailyEhi!)
                callsMar.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 4 {
            if aprDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                aprDateArray.append(dateEntered!)
                hgvApr.append(dailyHgv!)
                ehiApr.append(dailyEhi!)
                callsApr.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 5 {
            if mayDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                mayDateArray.append(dateEntered!)
                hgvMay.append(dailyHgv!)
                ehiMay.append(dailyEhi!)
                callsMay.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 6 {
            if junDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                junDateArray.append(dateEntered!)
                hgvJun.append(dailyHgv!)
                ehiJun.append(dailyEhi!)
                callsJun.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 7 {
            if julDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                julDateArray.append(dateEntered!)
                hgvJul.append(dailyHgv!)
                ehiJul.append(dailyEhi!)
                callsJul.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 8 {
            if augDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                augDateArray.append(dateEntered!)
                hgvAug.append(dailyHgv!)
                ehiAug.append(dailyEhi!)
                callsAug.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 9 {
            if sepDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                sepDateArray.append(dateEntered!)
                hgvSep.append(dailyHgv!)
                ehiSep.append(dailyEhi!)
                callsSep.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 10 {
            if octDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                octDateArray.append(dateEntered!)
                hgvOct.append(dailyHgv!)
                ehiOct.append(dailyEhi!)
                callsOct.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 11 {
            if novDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                novDateArray.append(dateEntered!)
                hgvNov.append(dailyHgv!)
                ehiNov.append(dailyEhi!)
                callsNov.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else if month == 12 {
            if decDateArray.contains(dateEntered!) {
                dateExists()
            } else {
                decDateArray.append(dateEntered!)
                hgvDec.append(dailyHgv!)
                ehiDec.append(dailyEhi!)
                callsDec.append(dailyCalls!)
                dateDoesNotExist()
            }
        } else {
            print("Something is Wrong")
        }

    }
    
    
    


    func saveData() {
        let dailyEntryDefaults = UserDefaults.standard
        dailyEntryDefaults.set(hgvJan, forKey: "janHgvTotal")
        dailyEntryDefaults.set(ehiJan, forKey: "janEhiTotal")
        dailyEntryDefaults.set(callsJan, forKey: "janTotalCalls")
        dailyEntryDefaults.set(janDateArray, forKey: "janDate")
        
        dailyEntryDefaults.set(hgvFeb, forKey: "febHgvTotal")
        dailyEntryDefaults.set(ehiFeb, forKey: "febEhiTotal")
        dailyEntryDefaults.set(callsFeb, forKey: "febTotalCalls")
        dailyEntryDefaults.set(febDateArray, forKey: "febDate")
        
        dailyEntryDefaults.set(hgvMar, forKey: "marHgvTotal")
        dailyEntryDefaults.set(ehiMar, forKey: "marEhiTotal")
        dailyEntryDefaults.set(callsMar, forKey: "marTotalCalls")
        dailyEntryDefaults.set(marDateArray, forKey: "marDate")
        
        dailyEntryDefaults.set(hgvApr, forKey: "aprHgvTotal")
        dailyEntryDefaults.set(ehiApr, forKey: "aprEhiTotal")
        dailyEntryDefaults.set(callsApr, forKey: "aprTotalCalls")
        dailyEntryDefaults.set(aprDateArray, forKey: "aprDate")
        
        dailyEntryDefaults.set(hgvMay, forKey: "mayHgvTotal")
        dailyEntryDefaults.set(ehiMay, forKey: "mayEhiTotal")
        dailyEntryDefaults.set(callsMay, forKey: "mayTotalCalls")
        dailyEntryDefaults.set(mayDateArray, forKey: "mayDate")
        
        dailyEntryDefaults.set(hgvJun, forKey: "junHgvTotal")
        dailyEntryDefaults.set(ehiJun, forKey: "junEhiTotal")
        dailyEntryDefaults.set(callsJun, forKey: "junTotalCalls")
        dailyEntryDefaults.set(junDateArray, forKey: "junDate")
        
        dailyEntryDefaults.set(hgvJul, forKey: "julHgvTotal")
        dailyEntryDefaults.set(ehiJul, forKey: "julEhiTotal")
        dailyEntryDefaults.set(callsJul, forKey: "julTotalCalls")
        dailyEntryDefaults.set(julDateArray, forKey: "julDate")
        
        dailyEntryDefaults.set(hgvAug, forKey: "augHgvTotal")
        dailyEntryDefaults.set(ehiAug, forKey: "augEhiTotal")
        dailyEntryDefaults.set(callsAug, forKey: "augTotalCalls")
        dailyEntryDefaults.set(augDateArray, forKey: "augDate")
        
        dailyEntryDefaults.set(hgvSep, forKey: "sepHgvTotal")
        dailyEntryDefaults.set(ehiSep, forKey: "sepEhiTotal")
        dailyEntryDefaults.set(callsSep, forKey: "sepTotalCalls")
        dailyEntryDefaults.set(sepDateArray, forKey: "sepDate")
        
        dailyEntryDefaults.set(hgvOct, forKey: "octHgvTotal")
        dailyEntryDefaults.set(ehiOct, forKey: "octEhiTotal")
        dailyEntryDefaults.set(callsOct, forKey: "octTotalCalls")
        dailyEntryDefaults.set(octDateArray, forKey: "octDate")
        
        dailyEntryDefaults.set(hgvNov, forKey: "novHgvTotal")
        dailyEntryDefaults.set(ehiNov, forKey: "novEhiTotal")
        dailyEntryDefaults.set(callsNov, forKey: "novTotalCalls")
        dailyEntryDefaults.set(novDateArray, forKey: "novDate")
        
        dailyEntryDefaults.set(hgvDec, forKey: "decHgvTotal")
        dailyEntryDefaults.set(ehiDec, forKey: "decEhiTotal")
        dailyEntryDefaults.set(callsDec, forKey: "decTotalCalls")
        dailyEntryDefaults.set(decDateArray, forKey: "decDate")
        
        dailyEntryDefaults.synchronize()

    }
    
    func setPickers() {
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

        
    }
    
    func setPickerToolbar() {
        
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

    }
    
    func dateExists() {
        let dateIsFull = UIAlertController(title: " Entry For Date Already Exists", message: "Try Again", preferredStyle: UIAlertControllerStyle.alert)
        dateIsFull.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(dateIsFull, animated: true, completion: nil)
    }
    
    func dateDoesNotExist() {
        let dailyDataEntered = UIAlertController(title: "Thank You", message: "You Did Great Today", preferredStyle: UIAlertControllerStyle.alert)
        dailyDataEntered.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(dailyDataEntered, animated: true, completion: nil)
        
        //Empty Strings to clear Text Fields
        hgvXfers.text = ""
        ehiXfers.text = ""
        callsTaken.text = ""
        enterDate.text = ""
    }
    
    
}































