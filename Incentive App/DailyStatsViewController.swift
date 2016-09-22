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

    @IBOutlet weak var menuBtn: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Goals"
        
        
        //Daily Goals
        let dGoal = UserDefaults.standard
        if let dData = dGoal.string(forKey: "dailyGoal"){
            print(dData)
        } else {
            dGoal.set("Nothing Here", forKey: "dailyGoal")
        }
        
        //Monthly Goals
        
        let mGoal = UserDefaults.standard
        if let mData = mGoal.string(forKey: "monthlyGoal") {
            print(mData)
        } else {
            mGoal.set("Nothing Here", forKey: "monthlyGoal")
            print("Monthly Nothing")
        }
        
        //Yearly Goals
        
        let yGoal = UserDefaults.standard
        if let yData = yGoal.string(forKey: "yearlyGoal") {
            print(yData)
        } else {
            yGoal.set("Nothing Here", forKey: "yearlyGoal")
            print("Yearly Nothing")
        }
        
        
        print("Begin Test")
        
        
        //Save Data in Arrays To User Defaults
        let dailyDefaults = UserDefaults.standard
        dailyDefaults.synchronize()
        
        //Test and Print Data in Arrays
        if let hgv = dailyDefaults.string(forKey: "dailyHgv") {
            print(hgv)
        }
        if let ehi = dailyDefaults.string(forKey: "dailyEhi") {
            print(ehi)
        }
        if let calls = dailyDefaults.string(forKey: "dailyCalls") {
            print(calls)
        }

        
        
        
        print("End Test")

        
        
//        // Daily Progress
        
        dailyProgress.animate(0, toAngle: 45, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }
        
        
        
        
//        // Monthly Progress
        monthlyProgress.animate(0, toAngle: 90, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }
        
        
        
//        // Yearly Progress
        
        yearlyProgress.animate(0, toAngle: 240, duration: 0.5) { completed in
            if completed {
                print("Animation Stopped, Completed")
            } else {
                print("Animation Stopped, Interrupted")
            }
        }

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    
}
