//
//  OtherWatchesCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 13/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class OtherWatchesCell: UITableViewCell {
    @IBOutlet weak var otherWatchesCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        otherWatchesCollectionView.delegate = dataSourceDelegate
        otherWatchesCollectionView.dataSource = dataSourceDelegate
        otherWatchesCollectionView.reloadData()
    }
}
