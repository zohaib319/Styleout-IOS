//
//  AdditionalFiltersCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 15/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class AdditionalFiltersCell: UITableViewCell {
    @IBOutlet weak var filterTypeTitle: UILabel!
    
    
    func setTitle(item : FiltersModel){
        filterTypeTitle.text = item.title
    }
}
