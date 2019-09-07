//
//  tableCell.swift
//  SampleApplication
//
//  Created by Vaibhav Mehta on 06/09/19.
//  Copyright © 2019 oz10. All rights reserved.
//

import UIKit

class tableCell: UITableViewCell {

    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    var model: Model?{
        
        didSet{
            
            lblName.text = model?.name
            lblPrice.text = model?.price
        }
    }
}
