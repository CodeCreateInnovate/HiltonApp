//
//  MonthDetailsModel.swift
//  Incentive App
//
//  Created by Erick Truong on 11/10/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import Foundation

class MonthsDetailsModel {
    private var _date: [String]!
    private var _Hgv: [Int]!
    private var _Ehi: [Int]!
    private var _Calls: [Int]!
    
    var Date: [String] {
        return _date
    }
    
    var Hgv: [Int] {
        return _Hgv
    }
    
    var Ehi: [Int] {
        return _Ehi
    }
    
    var Calls: [Int] {
        return _Calls
    }
    
    init(date: [String], Hgv: [Int], Ehi: [Int], Calls: [Int]) {
        _date = Date
        _Hgv = Hgv
        _Ehi = Ehi
        _Calls = Calls
    }
    
}
