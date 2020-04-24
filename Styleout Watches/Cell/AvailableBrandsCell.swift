//
//  AvailableBrandsCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 09/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class AvailableBrandsCell: UITableViewCell {
    
    
    @IBOutlet weak var availableBrandsCollectionView: UICollectionView!
    var collectionViewOffset: CGFloat {
        get {
            return availableBrandsCollectionView.contentOffset.x
        }

        set {
            availableBrandsCollectionView.contentOffset.x = newValue
        }
    }
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        availableBrandsCollectionView.delegate = dataSourceDelegate
        availableBrandsCollectionView.dataSource = dataSourceDelegate
        availableBrandsCollectionView.tag = row
        availableBrandsCollectionView.reloadData()
    }
}
