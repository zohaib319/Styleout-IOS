//
//  BrandsViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 13/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.register(UINib(nibName: "TopWatchesCell", bundle: .main), forCellWithReuseIdentifier: "topWatchesCellId")
            collectionView.register(UINib(nibName: "QuickFiltersCell", bundle: .main), forCellWithReuseIdentifier: "quickFiltersCellId")
            collectionView.register(UINib(nibName: "AllWatchesCell", bundle: .main), forCellWithReuseIdentifier: "allWatchesCellId")
            
            /**
             Supplementary views for header of collection view
             */
            collectionView.register(UINib(nibName: "TopWatchesHeader", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "topWatchesHeaderId")
            
            collectionView.register(UINib(nibName: "QuickFiltersHeader", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "quickFiltersHeaderId")
            collectionView.register(UINib(nibName: "AllWatchesHeader", bundle: .main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "allWatchesHeaderId")
        }
    }
    
    @IBOutlet weak var filtersButton: UIButton!
    
    /*
     Global variables
     */
    var topWatchesArray : [TopWatchesModel] = []
    var allWatchesArray : [AllWatchesModel] = []
    let quickFiltersArray : [String] = ["Available","Rolex","Patek Philippe","Royal Oak","Men's Watch/Unisex","Rose Gold"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        

        fetchData()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        let itemToAppend = TopWatchesModel(watchImage: "test", watchName: "Patek Philippe Nautilus 5711/1P-001 Platinum 40th anniversary", watchStatus: "• Pre owned | original box | papers")
        let itemToAppend2 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let itemToAppend3 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let itemToAppend4 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let itemToAppend5 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let itemToAppend6 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let itemToAppend7 = TopWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        
        let item = AllWatchesModel(watchImage: "test", watchName: "Patek Philippe Nautilus 5711/1P-001 Platinum 40th anniversary", watchStatus: "• Pre owned | original box | papers")
        let item2 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let item3 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let item4 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let item5 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let item6 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        let item7 = AllWatchesModel(watchImage: "test", watchName: "Richard Mille RM67-02 Alexis Pinturault", watchStatus: "• Pre owned | original box")
        
        
        
        topWatchesArray.append(itemToAppend)
        topWatchesArray.append(itemToAppend2)
        topWatchesArray.append(itemToAppend3)
        topWatchesArray.append(itemToAppend4)
        topWatchesArray.append(itemToAppend5)
        topWatchesArray.append(itemToAppend6)
        topWatchesArray.append(itemToAppend7)
        
        allWatchesArray.append(item)
        allWatchesArray.append(item2)
        allWatchesArray.append(item3)
        allWatchesArray.append(item4)
        allWatchesArray.append(item5)
        allWatchesArray.append(item6)
        allWatchesArray.append(item7)
        
        
        
        
        
        
    }
    
    @IBAction func filtersButtonClicked(_ sender: Any) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let filtersVC = storyBoard.instantiateViewController(withIdentifier: "FiltersViewController") as! FiltersViewController
//        let transition = CATransition()
//        transition.duration = 0.3
//        transition.type = CATransitionType(rawValue: "push")
//        transition.subtype = CATransitionSubtype.fromTop
//        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
//        navigationController?.pushViewController(filtersVC, animated: false)
    }
    
    
    

}
extension BrandsViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topWatchesCellId", for: indexPath) as! TopWatchesCell
            return cell
        }
        else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "quickFiltersCellId", for: indexPath) as! QuickFiltersCell
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "allWatchesCellId", for: indexPath) as! AllWatchesCell
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 250)
        }
        else if indexPath.section == 1{
            return CGSize(width: view.frame.width, height: 50)
        }
        else{
            return CGSize(width: view.frame.width, height: 2000)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 0 {
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "topWatchesHeaderId", for: indexPath) as! TopWatchesHeader

                //do other header related calls or settups
                   return reusableview
            }
            else if indexPath.section == 1{
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "quickFiltersHeaderId", for: indexPath) as! QuickFiltersHeader

                //do other header related calls or settups
                   return reusableview
            }
            else{
                let reusableview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "allWatchesHeaderId", for: indexPath) as! AllWatchesHeader

                //do other header related calls or settups
                reusableview.setHeaderTitle(title: "11,340 results")
                   return reusableview
            }
                
            


        default:  fatalError("Unexpected element kind")
        }
    }
    
}


