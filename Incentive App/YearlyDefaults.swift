//
//  YearlyDefaults.swift
//  Incentive App
//
//  Created by Erick Truong on 7/30/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import Foundation
class YearlyDefaults: NSObject, NSCoding {
        var yearlyGoal: Int!
    
    init(yGoal: Int) {
        yearlyGoal = yGoal
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.yearlyGoal = aDecoder.decodeObjectForKey("yearlyGoal") as! Int
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.yearlyGoal, forKey: "yearlyGoal")  
    }
}