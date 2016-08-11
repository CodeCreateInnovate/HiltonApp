//
//  LaunchVC.swift
//  Incentive App
//
//  Created by Erick Truong on 8/11/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class LaunchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  NSUserDefaults.standardUserDefaults().objectForKey("firstName") != nil &&
            NSUserDefaults.standardUserDefaults().objectForKey("lastName") != nil &&
            NSUserDefaults.standardUserDefaults().objectForKey("dailyGoal") != nil &&
            NSUserDefaults.standardUserDefaults().objectForKey("monthlyGoal") != nil &&
            NSUserDefaults.standardUserDefaults().objectForKey("yearlyGoal") != nil {
            dataIsFull()
            print("All Defaults Have Values")
        } else {
            dataIsEmpty()
            print("We Need Some Info")
        }

    }
    
    //Functions To Start View Controllers
    
    func dataIsFull() {
        print("All Defaults Have Values")
        self.performSegueWithIdentifier("DailyEntryVC", sender: nil)

    }
    
    func dataIsEmpty() {
        print("We Need Some Info")
        self.performSegueWithIdentifier("ViewController", sender: nil)
    }

}
