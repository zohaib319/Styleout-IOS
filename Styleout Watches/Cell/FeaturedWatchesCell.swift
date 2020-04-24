//
//  FeaturedWatchesCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 09/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class FeaturedWatchesCell: UITableViewCell {

    @IBOutlet weak var featuredWatchesCollection: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        get {
            return featuredWatchesCollection.contentOffset.x
        }

        set {
            featuredWatchesCollection.contentOffset.x = newValue
        }
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        featuredWatchesCollection.delegate = dataSourceDelegate
        featuredWatchesCollection.dataSource = dataSourceDelegate
        featuredWatchesCollection.reloadData()
    }
    

}
