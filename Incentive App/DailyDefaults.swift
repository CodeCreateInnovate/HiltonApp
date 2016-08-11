//
//  DailyDefaults.swift
//  Incentive App
//
//  Created by Erick Truong on 7/30/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import Foundation
class DailyDefaults: NSObject, NSCoding {
    var dailyGoal: Int!
    
    init(dGoal: Int) {
        dailyGoal = dGoal
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.dailyGoal = aDecoder.decodeObjectForKey("dailyGoal") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.dailyGoal, forKey: "dailyGoal")
    }
    
}