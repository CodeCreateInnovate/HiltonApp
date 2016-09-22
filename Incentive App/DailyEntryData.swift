//
//  DailyEntryData.swift
//  Incentive App
//
//  Created by Erick Truong on 8/31/16.
//  Copyright © 2016 CCI Design. All rights reserved.


//import UIKit
//
//class DailyEntryData: NSObject, NSCoding{
//    var hgv : Int32
//    var ehi : Int32
//    var calls : Int32
////    var date: NSDate
//    
//
//    
//    init(hgvFinal: Int32, ehiFinal: Int32, callsFinal: Int32) {
//
//        self.hgv = hgvFinal
//        self.ehi = ehiFinal
//        self.calls = callsFinal
////        super.init(hgvFinal: hgvFInal, ehiFinal: ehiFinal, callsFinal: callsFinal)
//    }
//
//
//    
//    required init(coder aDecoder: NSCoder) {
//        self.hgv = aDecoder.decodeInt32ForKey("hgvTotal")
//        self.ehi = aDecoder.decodeInt32ForKey("ehiTotal")
//        self.calls = aDecoder.decodeInt32ForKey("callsTotal")
//
//    }
//    
//    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeInt32(self.hgv, forKey: "hgvTotal")
//        aCoder.encodeInt32(self.ehi, forKey: "ehiTotal")
//        aCoder.encodeInt32(self.calls, forKey: "callsTotal")
//    }
// 
//}


//Update all View Controllers with NSUserDefaults with NSKey Archiver. Use Subclass to fill and move data.  Also add new properties to hold final statistics using calculations.