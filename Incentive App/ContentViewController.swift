//
//  ContentViewController.swift
//  Incentive App
//
//  Created by Erick Truong on 7/3/16.
//  Copyright © 2016 CCI Design. All rights reserved.
//

import UIKit

class ContentViewController: UIInputViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int!
    var titleIndex: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleIndex
    }

}
