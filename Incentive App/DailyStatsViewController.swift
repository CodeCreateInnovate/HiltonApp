//
//  DailyStatsViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/16/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//
import Foundation
import UIKit
import KDCircularProgress


class DailyStatsViewController: UIViewController {
    

    @IBOutlet weak var dailyProgress: KDCircularProgress!
    @IBOutlet weak var monthlyProgress: KDCircularProgress!
    @IBOutlet weak var yearlyProgress: KDCircularProgress!

    @IBOutlet weak var yearlyLabel: UILabel!
    @IBOutlet weak var monthlyLabel: UILabel!
    @IBOutlet weak var dailyLabel: UILabel!
    
    @IBOutlet weak var dailyRatePace: UILabel!
    @IBOutlet weak var monthlyRatePace: UILabel!
    @IBOutlet weak var yearlyRatePace: UILabel!
    
    
    @IBOutlet weak var dailyRate: UILabel!
    @IBOutlet weak var monthlyRate: UILabel!
    @IBOutlet weak var yearlyRate: UILabel!
    
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!

    
    var dailyTotal = String()
    var monthlyTotal = String()
    var yearlyTotal = String()
    
    
    
    
    
    //Set Arrays for Monthly HGV
    var hgvJan : [Int] = [0]
    var hgvFeb : [Int] = [0]
    var hgvMar : [Int] = [0]
    var hgvApr : [Int] = [0]
    var hgvMay : [Int] = [0]
    var hgvJun : [Int] = [0]
    var hgvJul : [Int] = [0]
    var hgvAug : [Int] = [0]
    var hgvSep : [Int] = [0]
    var hgvOct : [Int] = [0]
    var hgvNov : [Int] = [0]
    var hgvDec : [Int] = [0]
    
    //Set Arrays for Monthly EHI
    var ehiJan : [Int] = [0]
    var ehiFeb : [Int] = [0]
    var ehiMar : [Int] = [0]
    var ehiApr : [Int] = [0]
    var ehiMay : [Int] = [0]
    var ehiJun : [Int] = [0]
    var ehiJul : [Int] = [0]
    var ehiAug : [Int] = [0]
    var ehiSep : [Int] = [0]
    var ehiOct : [Int] = [0]
    var ehiNov : [Int] = [0]
    var ehiDec : [Int] = [0]

    //Set Arrays for Monthly Calls
    var callsJan : [Int] = [0]
    var callsFeb : [Int] = [0]
    var callsMar : [Int] = [0]
    var callsApr : [Int] = [0]
    var callsMay : [Int] = [0]
    var callsJun : [Int] = [0]
    var callsJul : [Int] = [0]
    var callsAug : [Int] = [0]
    var callsSep : [Int] = [0]
    var callsOct : [Int] = [0]
    var callsNov : [Int] = [0]
    var callsDec : [Int] = [0]

    
    //Set Arrays For Dates
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
        
        self.navigationItem.title = "Goals"

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        //Load Monthly Total Arrays
        let dailyEntryDefaults = UserDefaults.standard
        //Load HGV
        print("Begin HGV")
        
        if (dailyEntryDefaults.object(forKey: "janHgvTotal") != nil) {
            hgvJan = dailyEntryDefaults.object(forKey: "janHgvTotal") as! [Int]
            print(hgvJan.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "febHgvTotal") != nil) {
            hgvFeb = dailyEntryDefaults.object(forKey: "febHgvTotal") as! [Int]
            print(hgvFeb.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "marHgvTotal") != nil) {
            hgvMar = dailyEntryDefaults.object(forKey: "marHgvTotal") as! [Int]
            print(hgvMar.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "aprHgvTotal") != nil) {
            hgvApr = dailyEntryDefaults.object(forKey: "aprHgvTotal") as! [Int]
            print(hgvApr.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "mayHgvTotal") != nil) {
            hgvMay = dailyEntryDefaults.object(forKey: "mayHgvTotal") as! [Int]
            print(hgvMay.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "junHgvTotal") != nil) {
            hgvJun = dailyEntryDefaults.object(forKey: "junHgvTotal") as! [Int]
            print(hgvJun.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "julHgvTotal") != nil) {
            hgvJul = dailyEntryDefaults.object(forKey: "julHgvTotal") as! [Int]
            print(hgvJul.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "augHgvTotal") != nil) {
            hgvAug = dailyEntryDefaults.object(forKey: "augHgvTotal") as! [Int]
            print(hgvAug.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "sepHgvTotal") != nil) {
            hgvSep = dailyEntryDefaults.object(forKey: "sepHgvTotal") as! [Int]
            print(hgvSep.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "octHgvTotal") != nil) {
            hgvOct = dailyEntryDefaults.object(forKey: "octHgvTotal") as! [Int]
            print(hgvOct.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "novHgvTotal") != nil) {
            hgvNov = dailyEntryDefaults.object(forKey: "novHgvTotal") as! [Int]
            print(hgvNov.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "decHgvTotal") != nil) {
            hgvDec = dailyEntryDefaults.object(forKey: "decHgvTotal") as! [Int]
            print(hgvDec.reduce(0, {$0 + $1}))
        }
        print("End HGV")
        print("Begin EHI")
        
        
        //Load EHI
        if (dailyEntryDefaults.object(forKey: "janEhiTotal") != nil) {
            ehiJan = dailyEntryDefaults.object(forKey: "janEhiTotal") as! [Int]
            print(ehiJan.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "febEhiTotal") != nil) {
            ehiFeb = dailyEntryDefaults.object(forKey: "febEhiTotal") as! [Int]
            print(ehiFeb.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "marEhiTotal") != nil) {
            ehiMar = dailyEntryDefaults.object(forKey: "marEhiTotal") as! [Int]
            print(ehiMar.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "aprEhiTotal") != nil) {
            ehiApr = dailyEntryDefaults.object(forKey: "aprEhiTotal") as! [Int]
            print(ehiApr.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "mayEhiTotal") != nil) {
            ehiMay = dailyEntryDefaults.object(forKey: "mayEhiTotal") as! [Int]
            print(ehiMay.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "junEhiTotal") != nil) {
            ehiJun = dailyEntryDefaults.object(forKey: "junEhiTotal") as! [Int]
            print(ehiJun.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "julEhiTotal") != nil) {
            ehiJul = dailyEntryDefaults.object(forKey: "julEhiTotal") as! [Int]
            print(ehiJul.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "augEhiTotal") != nil) {
            ehiAug = dailyEntryDefaults.object(forKey: "augEhiTotal") as! [Int]
            print(ehiAug.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "sepEhiTotal") != nil) {
            ehiSep = dailyEntryDefaults.object(forKey: "sepEhiTotal") as! [Int]
            print(ehiSep.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "octEhiTotal") != nil) {
            ehiOct = dailyEntryDefaults.object(forKey: "octEhiTotal") as! [Int]
            print(ehiOct.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "novEhiTotal") != nil) {
            ehiNov = dailyEntryDefaults.object(forKey: "novEhiTotal") as! [Int]
            print(ehiNov.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "decEhiTotal") != nil) {
            ehiDec = dailyEntryDefaults.object(forKey: "decEhiTotal") as! [Int]
            print(ehiDec.reduce(0, {$0 + $1}))
        }
        
        print("End Ehi")
        print("Begin Calls")
        
        
        
        //Load Calls
        if (dailyEntryDefaults.object(forKey: "janTotalCalls") != nil) {
            callsJan = dailyEntryDefaults.object(forKey: "janTotalCalls") as! [Int]
            print(callsJan.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "febTotalCalls") != nil) {
            callsFeb = dailyEntryDefaults.object(forKey: "febTotalCalls") as! [Int]
            print(callsFeb.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "marTotalCalls") != nil) {
            callsMar = dailyEntryDefaults.object(forKey: "marTotalCalls") as! [Int]
            print(callsMar.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "aprTotalCalls") != nil) {
            callsApr = dailyEntryDefaults.object(forKey: "aprTotalCalls") as! [Int]
            print(callsApr.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "mayTotalCalls") != nil) {
            callsMay = dailyEntryDefaults.object(forKey: "mayTotalCalls") as! [Int]
            print(callsMay.reduce(0, {$0 + $1}))        }
        
        if (dailyEntryDefaults.object(forKey: "junTotalCalls") != nil) {
            callsJun = dailyEntryDefaults.object(forKey: "junTotalCalls") as! [Int]
            print(callsJun.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "julTotalCalls") != nil) {
            callsJul = dailyEntryDefaults.object(forKey: "julTotalCalls") as! [Int]
            print(callsJul.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "augTotalCalls") != nil) {
            callsAug = dailyEntryDefaults.object(forKey: "augTotalCalls") as! [Int]
            print(callsAug.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "sepTotalCalls") != nil) {
            callsSep = dailyEntryDefaults.object(forKey: "sepTotalCalls") as! [Int]
            print(callsSep.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "octTotalCalls") != nil) {
            callsOct = dailyEntryDefaults.object(forKey: "octTotalCalls") as! [Int]
            print(callsOct.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "novTotalCalls") != nil) {
            callsNov = dailyEntryDefaults.object(forKey: "novTotalCalls") as! [Int]
            print(callsNov.reduce(0, {$0 + $1}))
        }
        
        if (dailyEntryDefaults.object(forKey: "decTotalCalls") != nil) {
            callsDec = dailyEntryDefaults.object(forKey: "decTotalCalls") as! [Int]
            print(callsDec.reduce(0, {$0 + $1}))
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
    

        // Load Goals
        
        print("Begin Goals")
        
        let dGoal = UserDefaults.standard
        if let dData = dGoal.string(forKey: "dailyGoal"){
            dailyTotal = dData
            print("Daily Goal is \(dailyTotal) transfers")
        } else {
            dGoal.set("Nothing Here", forKey: "dailyGoal")
            print("Daily Nothing")
        }
        
        //Monthly Goals
        
        let mGoal = UserDefaults.standard
        if let mData = mGoal.string(forKey: "monthlyGoal") {
            monthlyTotal = mData
            print("Monthly Goal is \(monthlyTotal) transfers")
        } else {
            mGoal.set("Nothing Here", forKey: "monthlyGoal")
            print("Monthly Nothing")
        }
        
        //Yearly Goals
        
        let yGoal = UserDefaults.standard
        if let yData = yGoal.string(forKey: "yearlyGoal") {
            yearlyTotal = yData
            print("Yearly Goal is \(yearlyTotal) transfers")
        } else {
            yGoal.set("Nothing Here", forKey: "yearlyGoal")
            print("Yearly Nothing")
        }
        print("End Goals")
        
        let todaysDate = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let components = calendar?.components([.day , .month , .year], from: todaysDate as Date)
        let day = components?.day
        let year =  components?.year
        let month = components?.month
        let yesterday = (components?.day)!-1
        
        print(day)
        print(month)
        print(year)
        print(yesterday)
        print("Yesterday's Date")
        print("Begin Daily Angle")
 
        //Calc Daily Angle
        if month == 1 {
            calcDayAngle(hgv: hgvJan.last!, ehi: ehiJan.last!, dTotal: dailyTotal)
        } else if month == 2 {
            calcDayAngle(hgv: hgvFeb.last!, ehi: ehiFeb.last!, dTotal: dailyTotal)
        } else if month == 3 {
            calcDayAngle(hgv: hgvMar.last!, ehi: ehiMar.last!, dTotal: dailyTotal)
        } else if month == 4 {
            calcDayAngle(hgv: hgvApr.last!, ehi: ehiApr.last!, dTotal: dailyTotal)
        } else if month == 5 {
            calcDayAngle(hgv: hgvMay.last!, ehi: ehiMay.last!, dTotal: dailyTotal)
        } else if month == 6 {
            calcDayAngle(hgv: hgvJun.last!, ehi: ehiJun.last!, dTotal: dailyTotal)
        } else if month == 7 {
            calcDayAngle(hgv: hgvJul.last!, ehi: ehiJul.last!, dTotal: dailyTotal)
        } else if month == 8 {
            calcDayAngle(hgv: hgvAug.last!, ehi: ehiAug.last!, dTotal: dailyTotal)
        } else if month == 9 {
            calcDayAngle(hgv: hgvSep.last!, ehi: ehiSep.last!, dTotal: dailyTotal)
        } else if month == 10 {
            calcDayAngle(hgv: hgvOct.last!, ehi: ehiOct.last!, dTotal: dailyTotal)
        } else if month == 11 {
            calcDayAngle(hgv: hgvNov.last!, ehi: ehiNov.last!, dTotal: dailyTotal)
        } else if month == 12 {
            calcDayAngle(hgv: hgvDec.last!, ehi: ehiDec.last!, dTotal: dailyTotal)
        }
        

        
        print("End Daily Angle")
        
        print("Begin Month Angle")
        //Calc Monthly Angle
        if month == 1 {
            let reducedHgv = hgvJan.reduce(0, {$0 + $1})
            let reducedEhi = ehiJan.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 2 {
            let reducedHgv = hgvFeb.reduce(0, {$0 + $1})
            let reducedEhi = ehiFeb.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 3 {
            let reducedHgv = hgvMar.reduce(0, {$0 + $1})
            let reducedEhi = ehiMar.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 4 {
            let reducedHgv = hgvApr.reduce(0, {$0 + $1})
            let reducedEhi = ehiApr.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 5 {
            let reducedHgv = hgvMay.reduce(0, {$0 + $1})
            let reducedEhi = ehiMay.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 6 {
            let reducedHgv = hgvJun.reduce(0, {$0 + $1})
            let reducedEhi = ehiJun.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 7 {
            let reducedHgv = hgvJul.reduce(0, {$0 + $1})
            let reducedEhi = ehiJul.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 8 {
            let reducedHgv = hgvAug.reduce(0, {$0 + $1})
            let reducedEhi = ehiAug.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 9 {
            let reducedHgv = hgvSep.reduce(0, {$0 + $1})
            let reducedEhi = ehiSep.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 10 {
            let reducedHgv = hgvOct.reduce(0, {$0 + $1})
            let reducedEhi = ehiOct.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 11 {
            let reducedHgv = hgvNov.reduce(0, {$0 + $1})
            let reducedEhi = ehiNov.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        } else if month == 12 {
            let reducedHgv = hgvDec.reduce(0, {$0 + $1})
            let reducedEhi = ehiDec.reduce(0, {$0 + $1})
            calcMonthAngle(redHgv: reducedHgv, redEhi: reducedEhi, mTotal: monthlyTotal)
        }
        
        calcYearAngle()
}
    
    
    
//**** Beginning of Function Declaration
    
    func calcDayAngle(hgv: Int, ehi: Int, dTotal: String) {
        let hgvEhiDayTotal = hgv + ehi
        print(hgvEhiDayTotal)
        let newTotal = Double(hgvEhiDayTotal) / Double(dTotal)! * 100
        dailyLabel.text = "\(Int(newTotal))% of Goal"
        let dAngle = (newTotal * 360) / 100
        if newTotal < 5.1 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $.25 = $\(Float(hgvEhiDayTotal) * 0.25)"
        } else if newTotal >= 5.1 && newTotal <= 10.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $.50 = $\(String(Double(hgvEhiDayTotal) * 0.50))"
        } else if newTotal >= 10.1 && newTotal <= 15.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $.75 = $\(String(Double(hgvEhiDayTotal) * 0.75))"
        } else if newTotal >= 15.1 && newTotal <= 20.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $1.00 = $\(String(Double(hgvEhiDayTotal) * 1.00))"
        } else if newTotal >= 20.1 && newTotal <= 25.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $1.25 = $\(String(Double(hgvEhiDayTotal) * 1.25))"
        } else if newTotal >= 25.1 && newTotal <= 30.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $1.50 = $\(String(Double(hgvEhiDayTotal) * 1.50))"
        } else if newTotal >= 30.1 && newTotal <= 35.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $1.75 = $\(String(Double(hgvEhiDayTotal) * 1.75))"
        } else if newTotal > 35.0 {
            dailyRatePace.text = "\(hgvEhiDayTotal) xfers @ $2.00 = $\(Float(hgvEhiDayTotal) * 2.00)"
        }
        
        // Animate Circles
        
        dailyProgress.animate(0, toAngle: dAngle, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }
    }
    
    func calcMonthAngle(redHgv: Int, redEhi: Int, mTotal: String) {
        let hgvEhiMonthTotal = redHgv + redEhi
        let monNewTotal = (Double(hgvEhiMonthTotal) / Double(mTotal)!) * 100
        monthlyLabel.text = "\(Int(monNewTotal))% of Goal"
        let monAngle = (monNewTotal * 360) / 100
        if monNewTotal < 5.1 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $.25 = $\(String(Double(hgvEhiMonthTotal) * 0.25))"
        } else if monNewTotal >= 5.1 && monNewTotal <= 10.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $.50 = $\(String(Double(hgvEhiMonthTotal) * 0.50))"
        } else if monNewTotal >= 10.1 && monNewTotal <= 15.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $.75 = $\(String(Double(hgvEhiMonthTotal) * 0.75))"
        } else if monNewTotal >= 15.1 && monNewTotal <= 20.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $1.00 = $\(String(Double(hgvEhiMonthTotal) * 1.00))"
        } else if monNewTotal >= 20.1 && monNewTotal <= 25.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $1.25 = $\(String(Double(hgvEhiMonthTotal) * 1.25))"
        } else if monNewTotal >= 25.1 && monNewTotal <= 30.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $1.50 = $\(String(Double(hgvEhiMonthTotal) * 1.50))"
        } else if monNewTotal >= 30.1 && monNewTotal <= 35.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $1.75 = $\(String(Double(hgvEhiMonthTotal) * 1.75))"
        } else if monNewTotal > 35.0 {
            monthlyRatePace.text = "\(hgvEhiMonthTotal) Xfers @ $2.00 = $\(String(Double(hgvEhiMonthTotal) * 2.00))"
        }

        // Monthly Progress
        monthlyProgress.animate(0, toAngle: monAngle, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }

    }
    
    
    func calcYearAngle(){
        //Arrays To Add all Months Categories Together and Flatten and Reduce to Integer
        let hgvFinal = [hgvJan,hgvFeb,hgvMar,hgvApr,hgvMay,hgvJun,hgvJul,hgvAug,hgvSep,hgvOct,hgvNov,hgvDec]
        let flatHgvFinal = Array(hgvFinal.joined())
        let ehiFinal = [ehiJan,ehiFeb,ehiMar,ehiApr,ehiMay,ehiJun,ehiJul,ehiAug,ehiSep,ehiOct,ehiNov,ehiDec]
        let flatEhiFinal = Array(ehiFinal.joined())

        let hgvEhiYearTotal = (flatHgvFinal.reduce(0, {$0 + $1}) + flatEhiFinal.reduce(0, {$0 + $1}))
        let yearNewTotal = (Double(hgvEhiYearTotal) / Double(yearlyTotal)!) * 100
        let yearAngle = (yearNewTotal * 360) / 100
        yearlyLabel.text = "\(Int(yearNewTotal))% of Goal"
        
        if yearNewTotal < 5.1 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $.25 = $\(String(Double(hgvEhiYearTotal) * 0.25))"
        } else if yearNewTotal >= 5.1 && yearNewTotal <= 10.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $.50 = $\(String(Double(hgvEhiYearTotal) * 0.50))"
        } else if yearNewTotal >= 10.1 && yearNewTotal <= 15.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $.75 = $\(String(Double(hgvEhiYearTotal) * 0.75))"
        } else if yearNewTotal >= 15.1 && yearNewTotal <= 20.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $1.00 = $\(String(Double(hgvEhiYearTotal) * 1.00))"
        } else if yearNewTotal >= 20.1 && yearNewTotal <= 25.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $1.25 = $\(String(Double(hgvEhiYearTotal) * 1.25))"
        } else if yearNewTotal >= 25.1 && yearNewTotal <= 30.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $1.50 = $\(String(Double(hgvEhiYearTotal) * 1.50))"
        } else if yearNewTotal >= 30.1 && yearNewTotal <= 35.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $1.75 = $\(String(Double(hgvEhiYearTotal) * 1.75))"
        } else if yearNewTotal > 35.0 {
            yearlyRatePace.text = "\(hgvEhiYearTotal) Xfers @ $2.00 = $\(String(Double(hgvEhiYearTotal) * 2.00))"
        }

        //        // Yearly Progress
        yearlyProgress.animate(0, toAngle: yearAngle, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }
 
    }

}

