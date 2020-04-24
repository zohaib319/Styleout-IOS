//
//  OtherWatchesCollectionCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 13/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class OtherWatchesCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var watchImage: UIImageView!
    @IBOutlet weak var watchName: UILabel!
    @IBOutlet weak var watchStatus: UILabel!
    
    func setOtherWatch(item : OtherWatchesModel){
        shadowView.dropShadow()
        watchImage.image = UIImage(named: "watch")
        watchStatus.text = item.watchStatus!
        watchName.text = item.watchName!
        
    }
    
}
