//
//  TopWatchesCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 21/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class TopWatchesCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            print("registered")
            collectionView.register(UINib(nibName: "TopWatchesCollectionCell", bundle: .main), forCellWithReuseIdentifier: "topWatchesCollectionCellId")
            
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
}
extension TopWatchesCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topWatchesCollectionCellId", for: indexPath) as! TopWatchesCollectionCell
        cell.dropShadow()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 230)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
