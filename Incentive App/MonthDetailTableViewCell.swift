//
//  MonthDetailTableViewCell.swift
//  Incentive App
//
//  Created by Erick Truong on 11/10/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class MonthDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var hgvText: UITextField!
    @IBOutlet weak var ehiText: UITextField!
    @IBOutlet weak var callsText: UITextField!
    
    @IBOutlet var monthDetail: UITableView!
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(monthDetails: MonthsDetailsModel) {
        dateLbl.text = monthDetails.Date
        hgvText.text = monthDetails.Hgv
        ehiText.text = monthDetails.Ehi
        callsText.text = monthDetails.Calls
        
    }
    
}
