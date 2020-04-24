//
//  QuickFiltersCollectioncell.swift
//  Styleout Watches
//
//  Created by Zohaib on 22/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class QuickFiltersCollectioncell: UICollectionViewCell {

    @IBOutlet weak var outerView: UIView!
    
    @IBOutlet weak var filterTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setQuickFilter(filterItem: FiltersModel){
        filterTitle.text = filterItem.title!
    }

}
