//
//  TopFiltersCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 15/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class TopFiltersCell: UITableViewCell {
    @IBOutlet weak var filterTitle: UILabel!
    @IBOutlet weak var selectedFilter: UILabel!
    
    func setTopFilter(title: String, subTitle : String){
        filterTitle.text = title
        selectedFilter.text = subTitle
    }
}
