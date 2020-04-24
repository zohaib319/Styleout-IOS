//
//  QuickFiltersCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 22/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class QuickFiltersCell: UICollectionViewCell {
    
    var quickFiltersArray : [FiltersModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "QuickFiltersCollectioncell", bundle: .main), forCellWithReuseIdentifier: "quickFiltersCollectionCellId")
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let quickFilterItem = FiltersModel(id: 1, title: "Available")
        let quickFilterItem2 = FiltersModel(id: 2, title: "Rolex")
        let quickFilterItem3 = FiltersModel(id: 2, title: "Patek Philippe")
        let quickFilterItem4 = FiltersModel(id: 2, title: "Royal Oak")
        let quickFilterItem5 = FiltersModel(id: 2, title: "Men's Watch/Unisex")
        let quickFilterItem6 = FiltersModel(id: 2, title: "Rose Gold")
        
        
        quickFiltersArray.append(quickFilterItem)
        quickFiltersArray.append(quickFilterItem2)
        quickFiltersArray.append(quickFilterItem3)
        quickFiltersArray.append(quickFilterItem4)
        quickFiltersArray.append(quickFilterItem5)
        quickFiltersArray.append(quickFilterItem6)
    }

}
extension QuickFiltersCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quickFiltersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quickFiltersCollectionCellId", for: indexPath) as! QuickFiltersCollectioncell
        cell.dropShadow()
        let filterItem : FiltersModel
        filterItem = quickFiltersArray[indexPath.row]
        cell.setQuickFilter(filterItem: filterItem)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
}

