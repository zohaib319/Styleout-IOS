//
//  SubFiltersCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 15/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class SubFiltersCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var subFilterTitle: UILabel!
    
    func setSubFilter(item: FiltersModel){
        checkButton.layer.masksToBounds = true
        checkButton.layer.borderWidth = 0.2
        checkButton.layer.borderColor = UIColor.lightGray.cgColor
        
        subFilterTitle.text  = item.title
    }

}
