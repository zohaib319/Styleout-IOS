//
//  AllWatchesCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 22/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class AllWatchesCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "AllWatchesCollectioncell", bundle: .main), forCellWithReuseIdentifier: "allWatchesCollectionCellId")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
extension AllWatchesCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allWatchesCollectionCellId", for: indexPath) as! AllWatchesCollectioncell
        cell.dropShadow()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = UIScreen.main.bounds.height
        if height > 900 {
           return CGSize(width: (UIScreen.main.bounds.width / 5) - 15, height: 260)
        }
        else{
           return CGSize(width: (UIScreen.main.bounds.width / 2) - 15, height: 260)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}
