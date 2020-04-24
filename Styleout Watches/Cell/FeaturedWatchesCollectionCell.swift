//
//  FeaturedWatchesCollectionCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 09/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class FeaturedWatchesCollectionCell: UICollectionViewCell {
    @IBOutlet weak var watchImage: UIImageView!
    @IBOutlet weak var watchName: UILabel!
    @IBOutlet weak var watchDescription: UILabel!
    
    func setFeaturedWatch(){
        watchImage.image = UIImage(named: "watch")
        watchName.text = "Rolex"
        watchDescription.text = "Lorem ipsum dollar set amit "
        
    }
    
}
