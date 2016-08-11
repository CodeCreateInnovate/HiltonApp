//
//  MonthlyStatistics.swift
//  Incentive App
//
//  Created by Erick Truong on 7/29/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import Foundation

class NameDefaults: NSObject, NSCoding {
    var firstName: String!
    var lastName: String!
    

    init(fName: String, lName: String) {
        firstName = fName
        lastName = lName
    }
    
    // Need to this Save & Load Data from NSUserDefaults
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
    }
    
}
