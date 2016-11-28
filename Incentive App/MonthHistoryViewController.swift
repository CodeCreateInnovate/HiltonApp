//
//  MonthHistoryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 11/5/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class MonthHistoryViewController:UITableViewController {
//
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var monthTableView: UITableView!
//
    let months = ["January", "February", "March", "April","May","June","July", "August", "September", "October","November","December"]

//    var selectedMonth = [MonthsDetailsModel]()
  
//    //Set Arrays for Monthly HGV
//    var hgvJan : [Int] = []
//    var hgvFeb : [Int] = []
//    var hgvMar : [Int] = []
//    var hgvApr : [Int] = []
//    var hgvMay : [Int] = []
//    var hgvJun : [Int] = []
//    var hgvJul : [Int] = []
//    var hgvAug : [Int] = []
//    var hgvSep : [Int] = []
//    var hgvOct : [Int] = []
//    var hgvNov : [Int] = []
//    var hgvDec : [Int] = []
//    
//    //Set Arrays for Monthly EHI
//    var ehiJan : [Int] = []
//    var ehiFeb : [Int] = []
//    var ehiMar : [Int] = []
//    var ehiApr : [Int] = []
//    var ehiMay : [Int] = []
//    var ehiJun : [Int] = []
//    var ehiJul : [Int] = []
//    var ehiAug : [Int] = []
//    var ehiSep : [Int] = []
//    var ehiOct : [Int] = []
//    var ehiNov : [Int] = []
//    var ehiDec : [Int] = []
//    
//    //Set Arrays for Monthly Calls
//    var callsJan : [Int] = []
//    var callsFeb : [Int] = []
//    var callsMar : [Int] = []
//    var callsApr : [Int] = []
//    var callsMay : [Int] = []
//    var callsJun : [Int] = []
//    var callsJul : [Int] = []
//    var callsAug : [Int] = []
//    var callsSep : [Int] = []
//    var callsOct : [Int] = []
//    var callsNov : [Int] = []
//    var callsDec : [Int] = []
//    
//    //Set Arrays For Dates
//    var janDateArray : [String] = []
//    var febDateArray : [String] = []
//    var marDateArray : [String] = []
//    var aprDateArray : [String] = []
//    var mayDateArray : [String] = []
//    var junDateArray : [String] = []
//    var julDateArray : [String] = []
//    var augDateArray : [String] = []
//    var sepDateArray : [String] = []
//    var octDateArray : [String] = []
//    var novDateArray : [String] = []
//    var decDateArray : [String] = []

    
//    MARK: View Did Load

    override func viewDidLoad() {
        super.viewDidLoad()

//        //Load Monthly Total Arrays
//        let dailyEntryDefaults = UserDefaults.standard
//        
//        
//        if (dailyEntryDefaults.object(forKey: "janHgvTotal") != nil) {
//            hgvJan = dailyEntryDefaults.object(forKey: "janHgvTotal") as! [Int]
//            print(hgvJan)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "febHgvTotal") != nil) {
//            hgvFeb = dailyEntryDefaults.object(forKey: "febHgvTotal") as! [Int]
//            print(hgvFeb)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "marHgvTotal") != nil) {
//            hgvMar = dailyEntryDefaults.object(forKey: "marHgvTotal") as! [Int]
//            print(hgvMar)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "aprHgvTotal") != nil) {
//            hgvApr = dailyEntryDefaults.object(forKey: "aprHgvTotal") as! [Int]
//            print(hgvApr)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "mayHgvTotal") != nil) {
//            hgvMay = dailyEntryDefaults.object(forKey: "mayHgvTotal") as! [Int]
//            print(hgvMay)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "junHgvTotal") != nil) {
//            hgvJun = dailyEntryDefaults.object(forKey: "junHgvTotal") as! [Int]
//            print(hgvJun)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "julHgvTotal") != nil) {
//            hgvJul = dailyEntryDefaults.object(forKey: "julHgvTotal") as! [Int]
//            print(hgvJul)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "augHgvTotal") != nil) {
//            hgvAug = dailyEntryDefaults.object(forKey: "augHgvTotal") as! [Int]
//            print(hgvAug)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "sepHgvTotal") != nil) {
//            hgvSep = dailyEntryDefaults.object(forKey: "sepHgvTotal") as! [Int]
//            print(hgvSep)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "octHgvTotal") != nil) {
//            hgvOct = dailyEntryDefaults.object(forKey: "octHgvTotal") as! [Int]
//            print(hgvOct)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "novHgvTotal") != nil) {
//            hgvNov = dailyEntryDefaults.object(forKey: "novHgvTotal") as! [Int]
//            print(hgvNov)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "decHgvTotal") != nil) {
//            hgvDec = dailyEntryDefaults.object(forKey: "decHgvTotal") as! [Int]
//            print(hgvDec)
//        }
//        
//        
//        
//        //Load EHI Data
//        if (dailyEntryDefaults.object(forKey: "janEhiTotal") != nil) {
//            ehiJan = dailyEntryDefaults.object(forKey: "janEhiTotal") as! [Int]
//            print(ehiJan)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "febEhiTotal") != nil) {
//            ehiFeb = dailyEntryDefaults.object(forKey: "febEhiTotal") as! [Int]
//            print(ehiFeb)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "marEhiTotal") != nil) {
//            ehiMar = dailyEntryDefaults.object(forKey: "marEhiTotal") as! [Int]
//            print(ehiMar)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "aprEhiTotal") != nil) {
//            ehiApr = dailyEntryDefaults.object(forKey: "aprEhiTotal") as! [Int]
//            print(ehiApr)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "mayEhiTotal") != nil) {
//            ehiMay = dailyEntryDefaults.object(forKey: "mayEhiTotal") as! [Int]
//            print(ehiMay)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "junEhiTotal") != nil) {
//            ehiJun = dailyEntryDefaults.object(forKey: "junEhiTotal") as! [Int]
//            print(ehiJun)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "julEhiTotal") != nil) {
//            ehiJul = dailyEntryDefaults.object(forKey: "julEhiTotal") as! [Int]
//            print(ehiJul)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "augEhiTotal") != nil) {
//            ehiAug = dailyEntryDefaults.object(forKey: "augEhiTotal") as! [Int]
//            print(ehiAug)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "sepEhiTotal") != nil) {
//            ehiSep = dailyEntryDefaults.object(forKey: "sepEhiTotal") as! [Int]
//            print(ehiSep)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "octEhiTotal") != nil) {
//            ehiOct = dailyEntryDefaults.object(forKey: "octEhiTotal") as! [Int]
//            print(ehiOct)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "novEhiTotal") != nil) {
//            ehiNov = dailyEntryDefaults.object(forKey: "novEhiTotal") as! [Int]
//            print(ehiNov)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "decEhiTotal") != nil) {
//            ehiDec = dailyEntryDefaults.object(forKey: "decEhiTotal") as! [Int]
//            print(ehiDec)
//        }
//        
//        
//        //Load Calls Data
//        if (dailyEntryDefaults.object(forKey: "janTotalCalls") != nil) {
//            callsJan = dailyEntryDefaults.object(forKey: "janTotalCalls") as! [Int]
//            print(callsJan)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "febTotalCalls") != nil) {
//            callsFeb = dailyEntryDefaults.object(forKey: "febTotalCalls") as! [Int]
//            print(callsFeb)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "marTotalCalls") != nil) {
//            callsMar = dailyEntryDefaults.object(forKey: "marTotalCalls") as! [Int]
//            print(callsMar)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "aprTotalCalls") != nil) {
//            callsApr = dailyEntryDefaults.object(forKey: "aprTotalCalls") as! [Int]
//            print(callsApr)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "mayTotalCalls") != nil) {
//            callsMay = dailyEntryDefaults.object(forKey: "mayTotalCalls") as! [Int]
//            print(callsMay)        }
//        
//        if (dailyEntryDefaults.object(forKey: "junTotalCalls") != nil) {
//            callsJun = dailyEntryDefaults.object(forKey: "junTotalCalls") as! [Int]
//            print(callsJun)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "julTotalCalls") != nil) {
//            callsJul = dailyEntryDefaults.object(forKey: "julTotalCalls") as! [Int]
//            print(callsJul)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "augTotalCalls") != nil) {
//            callsAug = dailyEntryDefaults.object(forKey: "augTotalCalls") as! [Int]
//            print(callsAug)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "sepTotalCalls") != nil) {
//            callsSep = dailyEntryDefaults.object(forKey: "sepTotalCalls") as! [Int]
//            print(callsSep)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "octTotalCalls") != nil) {
//            callsOct = dailyEntryDefaults.object(forKey: "octTotalCalls") as! [Int]
//            print(callsOct)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "novTotalCalls") != nil) {
//            callsNov = dailyEntryDefaults.object(forKey: "novTotalCalls") as! [Int]
//            print(callsNov)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "decTotalCalls") != nil) {
//            callsDec = dailyEntryDefaults.object(forKey: "decTotalCalls") as! [Int]
//            print(callsDec)
//        }
//        
//        //Load Dates
//        if (dailyEntryDefaults.object(forKey: "janDate") != nil) {
//            janDateArray = dailyEntryDefaults.object(forKey: "janDate") as! [String]
//            print(janDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "febDate") != nil) {
//            febDateArray = dailyEntryDefaults.object(forKey: "febDate") as! [String]
//            print(febDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "marDate") != nil) {
//            marDateArray = dailyEntryDefaults.object(forKey: "marDate") as! [String]
//            print(marDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "aprDate") != nil) {
//            aprDateArray = dailyEntryDefaults.object(forKey: "aprDate") as! [String]
//            print(aprDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "mayDate") != nil) {
//            mayDateArray = dailyEntryDefaults.object(forKey: "mayDate") as! [String]
//            print(mayDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "junDate") != nil) {
//            junDateArray = dailyEntryDefaults.object(forKey: "junDate") as! [String]
//            print(junDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "julDate") != nil) {
//            julDateArray = dailyEntryDefaults.object(forKey: "julDate") as! [String]
//            print(julDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "augDate") != nil) {
//            augDateArray = dailyEntryDefaults.object(forKey: "augDate") as! [String]
//            print(augDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "sepDate") != nil) {
//            sepDateArray = dailyEntryDefaults.object(forKey: "sepDate") as! [String]
//            print(sepDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "octDate") != nil) {
//            octDateArray = dailyEntryDefaults.object(forKey: "octDate") as! [String]
//            print(octDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "novDate") != nil) {
//            novDateArray = dailyEntryDefaults.object(forKey: "novDate") as! [String]
//            print(novDateArray)
//        }
//        
//        if (dailyEntryDefaults.object(forKey: "decDate") != nil) {
//            decDateArray = dailyEntryDefaults.object(forKey: "decDate") as! [String]
//            print(decDateArray)
//        }


//        selectedMonth = [MonthsDetailsModel(date: ["Yes","No","Maybe"])]
//            [MonthsDetailsModel(date: janDateArray, Hgv: hgvJan, Ehi: ehiJan, Calls: callsJan),
//                         MonthsDetailsModel(date: febDateArray, Hgv: hgvFeb, Ehi: ehiFeb, Calls: callsFeb),
//                         MonthsDetailsModel(date: marDateArray, Hgv: hgvMar, Ehi: ehiMar, Calls: callsMar),
//                         MonthsDetailsModel(date: aprDateArray, Hgv: hgvApr, Ehi: ehiApr, Calls: callsApr),
//                         MonthsDetailsModel(date: mayDateArray, Hgv: hgvMay, Ehi: ehiMay, Calls: callsMay),
//                         MonthsDetailsModel(date: junDateArray, Hgv: hgvJun, Ehi: ehiJun, Calls: callsJun),
//                         MonthsDetailsModel(date: julDateArray, Hgv: hgvJul, Ehi: ehiJul, Calls: callsJul),
//                         MonthsDetailsModel(date: augDateArray, Hgv: hgvAug, Ehi: ehiAug, Calls: callsAug),
//                         MonthsDetailsModel(date: sepDateArray, Hgv: hgvSep, Ehi: ehiSep, Calls: callsSep),
//                         MonthsDetailsModel(date: octDateArray, Hgv: hgvOct, Ehi: ehiOct, Calls: callsOct),
//                         MonthsDetailsModel(date: novDateArray, Hgv: hgvNov, Ehi: ehiNov, Calls: callsNov),
//                         MonthsDetailsModel(date: decDateArray, Hgv: hgvDec, Ehi: ehiDec, Calls: callsDec),]
    
//         Reveal View Comtroller
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "monthsCell", for: indexPath) as UITableViewCell

        cell.backgroundColor = UIColor.init(red: 15, green: 43, blue: 124, alpha: 0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Light", size:22)
        cell.textLabel!.text = months[indexPath.row]
        return cell
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let month = self.selectedMonth[indexPath.row]
//        self.performSegue(withIdentifier: "chosenMonth", sender: month)
//    }
//    
//    
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! MonthDetailViewController
//        destinationVC.selected
//    }
//    
}



































