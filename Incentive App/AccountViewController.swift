//
//  AccountViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/4/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var dailyGoal: UITextField!
    @IBOutlet weak var monthlyGoal: UITextField!
    @IBOutlet weak var yearlyGoal: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Account Info"
        
        textFieldShouldReturn(firstName)
        textFieldShouldReturn(lastName)
        textFieldShouldReturn(dailyGoal)
        textFieldShouldReturn(monthlyGoal)
        textFieldShouldReturn(yearlyGoal)
        hideKeyboardWhenTappedAround()
        
        
        
        
        
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.dailyGoal.delegate = self
        self.monthlyGoal.delegate = self
        self.yearlyGoal.delegate = self

        //Reveal View Controller

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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
     
        self.view.endEditing(true)
        return false
    }


}



