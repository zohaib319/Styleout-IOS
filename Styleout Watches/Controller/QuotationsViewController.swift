//
//  QuotationsViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 11/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class QuotationsViewController: UIViewController {
    
    @IBOutlet weak var changeDataTypeButton: UIBarButtonItem!
    @IBOutlet weak var quotationsCollectionView: UICollectionView!{
        didSet{
            // Nibs Register
            quotationsCollectionView.register(UINib(nibName: "UserQuotationsGridCell", bundle: .main), forCellWithReuseIdentifier: "userQuotationsGridCellId")
            quotationsCollectionView.register(UINib(nibName: "UserQuotationListCell", bundle: .main), forCellWithReuseIdentifier: "userQuotationsListCellId")
            
            
        }
    }
    var dataDisplayType: String = "Grid"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quotationsCollectionView.delegate = self
        quotationsCollectionView.dataSource = self
        
        changeDataTypeButton.image = UIImage(named: "list_icon")
        quotationsCollectionView.reloadData()
        
    }
    
    @IBAction func changeDataDisplayType(_ sender: Any) {
        
        if dataDisplayType == "List" {
            dataDisplayType = "Grid"
            changeDataTypeButton.image = UIImage(named: "list_icon")
        }
        else if dataDisplayType == "Grid"{
            changeDataTypeButton.image = UIImage(named: "grid_icon")
            dataDisplayType = "List"
        }
        
        quotationsCollectionView.reloadData()
    }
    
    
    
}
extension QuotationsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if dataDisplayType == "List" {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userQuotationsListCellId", for: indexPath) as! UserQuotationListCell
            cell.dropShadow()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userQuotationsGridCellId", for: indexPath) as! UserQuotationsGridCell
            cell.dropShadow()
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if dataDisplayType == "List" {
            return CGSize(width: view.frame.width, height: 100)
        }
        else{
            return CGSize(width: (view.frame.width / 2) - 15, height: 270)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    
}
