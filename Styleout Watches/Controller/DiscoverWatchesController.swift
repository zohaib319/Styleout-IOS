//
//  DiscoverWatchesController.swift
//  Styleout Watches
//
//  Created by Zohaib on 08/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit
import FSPagerView


class DiscoverWatchesController: UIViewController,UISearchResultsUpdating,UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    @IBOutlet weak var featuredWatchesTableView: UITableView!
    let featuredWatchesArray : [FeaturedWatchesModel] = []
    
    @IBOutlet weak var buyWatchInstructionsContainerView: FSPagerView!{
        didSet{
            let nib = UINib(nibName: "BuyWatchInstructionsCell", bundle: nil)
            buyWatchInstructionsContainerView.register(nib, forCellWithReuseIdentifier: "buyWatchInstructionsCellId")
        }
    }
    @IBOutlet weak var mainSliderContainerView: FSPagerView!{
        didSet{
            let nib = UINib(nibName: "MainSliderCell", bundle: nil)
            mainSliderContainerView.register(nib, forCellWithReuseIdentifier: "mainSliderCellId")
            
        }
    }
    
    
    @IBOutlet weak var trustedSellerSectionView: UIView!
    var pageControl = UIPageControl()
    
    /**
     Global variables
     */
    var watchInstructionsArray : [BuyWatchInstructionsModel] = []
    var mainSliderArray : [MainSliderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         Setting delegate and data sources for table views
         */
        featuredWatchesTableView.delegate = self
        featuredWatchesTableView.dataSource = self
        buyWatchInstructionsContainerView.delegate = self
        buyWatchInstructionsContainerView.dataSource = self
        mainSliderContainerView.delegate = self
        mainSliderContainerView.dataSource = self
        
        
        
        featuredWatchesTableView.tableHeaderView = UIView()
        trustedSellerSectionView.dropShadow()
        
        // search bar
    
        
        fetchWatchInstructionsData()
        
        
    }
    func fetchWatchInstructionsData(){
        let step1 = BuyWatchInstructionsModel(image: "selectWatch", instructions: "Select Your Watch", subInstructions: "Choose your dream watch from our extensive inventory.")
        let step2 = BuyWatchInstructionsModel(image: "scheduleVisit", instructions: "Schedule A Visit", subInstructions: "Schedule a time to see the watch of your dreams.")
        let step3 = BuyWatchInstructionsModel(image: "payVisit", instructions: "Visit Our Atilier", subInstructions: "Our concierge will assist you with the purchase of your watch.")
        let step4 = BuyWatchInstructionsModel(image: "buyWatch", instructions: "Buy Your Dream Watch", subInstructions: "Buy your watch on the spot or we ship it to you.")
        watchInstructionsArray.append(step1)
        watchInstructionsArray.append(step2)
        watchInstructionsArray.append(step3)
        watchInstructionsArray.append(step4)
        
        let slide1 = MainSliderModel(image: "main_slider_1", description: "Buy Your Dream Watch")
        mainSliderArray.append(slide1)
        
        
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: 200,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = watchInstructionsArray.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor =  UIColor(named: "pageControlInActiveColor")
        self.pageControl.pageIndicatorTintColor = UIColor(named: "pageControlInActiveColor")
        self.pageControl.currentPageIndicatorTintColor = UIColor(named: "pageControlActiveColor")
        buyWatchInstructionsContainerView.addSubview(pageControl)
        
        
    }
    
}
extension DiscoverWatchesController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource,FSPagerViewDelegate,FSPagerViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "featuredWatchesCellId") as! FeaturedWatchesCell
        }
        else if indexPath.section == 1{
            cell = tableView.dequeueReusableCell(withIdentifier: "availableBrandsCellId") as! AvailableBrandsCell
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            guard let tableViewCell = cell as? FeaturedWatchesCell else{
                return
            }
            tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        } else if indexPath.section == 1{
            guard let tableViewCell = cell as? AvailableBrandsCell else{
                return
            }
            tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        }
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }
        else {
            return 5
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedWatchesCollectionId", for: indexPath) as! FeaturedWatchesCollectionCell
            cell.setFeaturedWatch()
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "availableBrandsCollectionId", for: indexPath) as! AvailableBrandsCollectionCell
            cell.dropShadow()
            cell.setBrand()
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 270
            
        }
        else{
            return 90
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:10, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Regular", size: 20)
            label.text = "Featured Watches";
            view.addSubview(label);
            view.backgroundColor = .clear
            return view
        }
        else{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:10, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Regular", size: 20)
            label.text = "Available Brands";
            view.addSubview(label);
            view.backgroundColor = .clear
            return view
        }
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 4 {
//            let watchDetailsVC = WatchDetailsViewController()
//            navigationController?.pushViewController(watchDetailsVC, animated: true)
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let watchDetailsVC = storyBoard.instantiateViewController(withIdentifier: "WatchDetailsViewController") as! WatchDetailsViewController
            navigationController?.pushViewController(watchDetailsVC, animated: true)
        }
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let brandsVC = storyBoard.instantiateViewController(withIdentifier: "BrandsViewController") as! BrandsViewController
            navigationController?.pushViewController(brandsVC, animated: true)
        }
    }
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        if pagerView.tag == 1 {
            return mainSliderArray.count
        }
        else{
            return watchInstructionsArray.count
        }
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        if pagerView.tag == 1 {
            let cell1 = pagerView.dequeueReusableCell(withReuseIdentifier: "mainSliderCellId", at: index) as! MainSliderCell
            let slide : MainSliderModel
            slide = mainSliderArray[index]
            cell1.setSlide(slide: slide)
            return cell1
        }
        else{
            let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "buyWatchInstructionsCellId", at: index) as! BuyWatchInstructionsCell
            let item : BuyWatchInstructionsModel
            item = watchInstructionsArray[index]
            cell.setInstructions(item: item)
            return cell
        }
        
    }
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    
    
    
}
