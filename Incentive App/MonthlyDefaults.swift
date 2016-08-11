//
//  MonthlyDefaults.swift
//  Incentive App
//
//  Created by Erick Truong on 7/30/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import Foundation
class MonthlyDefaults: NSObject, NSCoding {
        var monthlyGoal: Int!
    
    init(mGoal: Int) {
        monthlyGoal = mGoal
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.monthlyGoal = aDecoder.decodeObjectForKey("monthlyGoal") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.monthlyGoal, forKey: "monthlyGoal")
    }
}