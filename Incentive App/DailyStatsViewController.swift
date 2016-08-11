//
//  DailyStatsViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/16/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//
import Foundation
import UIKit


class DailyStatsViewController: UIViewController {

    
    @IBOutlet weak var menuBtn: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dGoal = NSUserDefaults.standardUserDefaults()
        if let dData = dGoal.stringForKey("dailyGoal"){
            print(dData)
        } else {
            dGoal.setObject("Nothing Here", forKey: "dailyGoal")
        }

        
        
        self.navigationItem.title = "Daily"
        
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
