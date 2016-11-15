//
//  MonthHistoryViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 11/5/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class MonthHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet var monthTableView: UITableView!

    let months = ["January", "February", "March", "April","May","June","July", "August", "September", "October","November","December"]
    

    
    var selectedMonth = "Default"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.monthTableView.dataSource = self
        self.monthTableView.delegate = self
    
        // Reveal View Comtroller
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.init(red: 15, green: 43, blue: 124, alpha: 0)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:"HelveticaNeue-Light", size:22)
        cell.textLabel!.text = months[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMonth = months[indexPath.row]
        self.performSegue(withIdentifier: "toMonthDetail", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var indexPath : NSIndexPath = self.monthTableView.indexPathForSelectedRow! as NSIndexPath
//        
//        var detailVC = segue.destination as! MonthDetailViewController
//        
//
//    }
    
    

}
