//
//  AllWatchesHeader.swift
//  Styleout Watches
//
//  Created by Zohaib on 22/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class AllWatchesHeader: UICollectionViewCell {

    @IBOutlet weak var headerTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setHeaderTitle(title: String){
        headerTitle.text = title
    }
}
