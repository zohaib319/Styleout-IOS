//
//  AvailableBrandsCollectionCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 09/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class AvailableBrandsCollectionCell: UICollectionViewCell {
    

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var brandName: UILabel!
    
    
    func setBrand(){
        brandName.text = "Rolex"
        
    }
    
}
