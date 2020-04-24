//
//  WatchDetailsViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 12/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit
import AVKit

class WatchDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var watchConditionsArray : [WatchConditionsModel] = []
    var watchBasicInfoArray : [WatchConditionsModel] =  []
    var watchCaliberDetailsArray : [WatchConditionsModel] =  []
    var watchCaseDetailsArray : [WatchConditionsModel] =  []
    var watchBraceletDetailsArray : [WatchConditionsModel] =  []
    var otherWatchesArray : [OtherWatchesModel] = []

    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var watchDetailstableView: UITableView!
    @IBOutlet weak var picturesCarousel: UIScrollView!
    @IBOutlet weak var picturesCaruoselsImageView: UIImageView!
    @IBOutlet weak var imageLoader: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watchDetailstableView.delegate = self
        watchDetailstableView.dataSource = self
        watchDetailstableView.tableFooterView = UIView()
        
        
        fetchData()
        
        

        // Do any additional setup after loading the view.
    }
    /**
     Get A Quotation Button Click Event
     */
    @IBAction func getAQuoteClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let getQuotationVC = storyBoard.instantiateViewController(withIdentifier: "GetQuotationController") as! GetQuotationController
        navigationController?.pushViewController(getQuotationVC, animated: true)
    }
    @IBAction func unboxingVideoButtonClicked(_ sender: Any) {
        let videoURL = URL(string: "https://styleoutwatches.sirv.com/ap-6/ACENZZyklq.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player

        present(playerViewController, animated: true) {
          player.play()
        }
        
    }
    
    
    
    
    /**
     Delegates and Data source methods for Watch Details Table View
     
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "watchDetailsCellId") as! WatchDetailsCell
        cell.selectionStyle = .none
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "watchConditionsCellId") as! WatchConditionsCell
            let item : WatchConditionsModel
            item = watchConditionsArray[indexPath.row]
            cell.setWatchConditionsCellData(data: item)
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == 1{
            let item : WatchConditionsModel
            item = watchBasicInfoArray[indexPath.row]
            cell.setWatchDetailsCellData(data: item)
            return cell
        }
        else if indexPath.section == 2{
            let item : WatchConditionsModel
            item = watchCaliberDetailsArray[indexPath.row]
            cell.setWatchDetailsCellData(data: item)
            return cell
        }
        else if indexPath.section == 3{
            let item : WatchConditionsModel
            item = watchCaseDetailsArray[indexPath.row]
            cell.setWatchDetailsCellData(data: item)
            return cell
        }
            
        else if indexPath.section == 4 {
            let item : WatchConditionsModel
            item = watchBraceletDetailsArray[indexPath.row]
            cell.setWatchDetailsCellData(data: item)
            return cell
        }
        else {
           let  otherWatchesCell = tableView.dequeueReusableCell(withIdentifier: "otherWatchesCellId") as! OtherWatchesCell
            otherWatchesCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            return otherWatchesCell
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return watchConditionsArray.count
        }
        else if section == 1{
            return watchBasicInfoArray.count
        }
        else if section == 2{
            return watchCaliberDetailsArray.count
        }
        else if section == 3{
            return watchCaseDetailsArray.count
        }
        else if section == 4 {
            return watchBraceletDetailsArray.count
        }
            // Other Watches Collection cell
        else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }
        else if indexPath.section == 1{
            return 50
        }else if indexPath.section == 2{
            return 50
        }else if indexPath.section == 3{
            return 50
        }else if indexPath.section == 4{
            return 50
        }
        else {
            return 260
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
             let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
             let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
             label.font = UIFont(name: "Roboto-Thin", size: 12)
             label.text = "Availibility";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
             view.addSubview(label);
             view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
             return view
        }
        else if section == 1{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Thin", size: 12)
            label.text = "Basic Info";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
            return view
        }
        else if section == 2{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Thin", size: 12)
            label.text = "Caliber";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
            return view
        }
        else if section == 3{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Thin", size: 12)
            label.text = "Case";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
            return view
        }
        else if section  == 4{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Thin", size: 12)
            label.text = "Bracelet/Strap";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
            return view
        }
        else {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.font = UIFont(name: "Roboto-Thin", size: 12)
            label.text = "You may also be interested in these watches";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = UIColor(named: "watchImagesBackgroundColor")
            return view
        }
        
    }
    /**
     Delegates and data source methods for other watches collection view
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherWatchesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherWatchesCollectionCellId", for: indexPath) as! OtherWatchesCollectionCell
        let item : OtherWatchesModel
        item = otherWatchesArray[indexPath.row]
        
        cell.setOtherWatch(item: item)
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let watchDetailsVC = storyBoard.instantiateViewController(withIdentifier: "WatchDetailsViewController") as! WatchDetailsViewController
        navigationController?.pushViewController(watchDetailsVC, animated: true)
    }
    
    func fetchData(){
        
        let itemtoAppend = WatchConditionsModel(title: "Condition", subTitle: "Used")
        let itemtoAppend2 = WatchConditionsModel(title: "Availability", subTitle: "Available now")
        let itemtoAppend3 = WatchConditionsModel(title: "Scope of delivery", subTitle: "Original box, no original papers")
        let itemtoAppend4 = WatchConditionsModel(title: "Test", subTitle: "Test")
        watchConditionsArray.append(itemtoAppend)
        watchConditionsArray.append(itemtoAppend2)
        watchConditionsArray.append(itemtoAppend3)
        watchConditionsArray.append(itemtoAppend4)
        
        
        
        let basicInfoItem = WatchConditionsModel(title: "Listing Number", subTitle: "XR1234")
        let basicInfoItem2 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem3 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem4 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem5 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem6 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem7 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem8 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem9 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        let basicInfoItem10 = WatchConditionsModel(title: "Brand", subTitle: "Rolex")
        watchBasicInfoArray.append(basicInfoItem)
        watchBasicInfoArray.append(basicInfoItem2)
        watchBasicInfoArray.append(basicInfoItem3)
        watchBasicInfoArray.append(basicInfoItem4)
        watchBasicInfoArray.append(basicInfoItem5)
        watchBasicInfoArray.append(basicInfoItem6)
        watchBasicInfoArray.append(basicInfoItem7)
        watchBasicInfoArray.append(basicInfoItem8)
        watchBasicInfoArray.append(basicInfoItem9)
        watchBasicInfoArray.append(basicInfoItem10)
        
        watchCaliberDetailsArray.append(basicInfoItem3)
        
        watchCaseDetailsArray.append(basicInfoItem6)
        watchCaseDetailsArray.append(basicInfoItem7)
        watchCaseDetailsArray.append(basicInfoItem8)
        watchCaseDetailsArray.append(basicInfoItem9)
        watchCaseDetailsArray.append(basicInfoItem10)
        
        watchBraceletDetailsArray.append(basicInfoItem8)
        watchBraceletDetailsArray.append(basicInfoItem9)
        watchBraceletDetailsArray.append(basicInfoItem10)
        
        let otherWatchItem = OtherWatchesModel(watchImage: "test", watchName: "Patek Philippe Nautilus 5711/1P-001 Platinum 40th anniversary", watchStatus: "Available")
        let otherWatchItem2 = OtherWatchesModel(watchImage: "test", watchName: "Patek Philippe Aquanaut White Gold 5168 G-001", watchStatus: "Pre Owned")
        
        otherWatchesArray.append(otherWatchItem)
        otherWatchesArray.append(otherWatchItem2)
        
        
        
        watchDetailstableView.reloadData()
        tableViewHeightConstraint.constant = watchDetailstableView.contentSize.height + 500
        
        
        
        
    }
//    func setupImages(){
//
//        /**
//         Create Data Array from image urls
//         */
//        var dataArray : [Data] = []
//
//        for i in 0..<picturesArray.count{
//            guard let url = URL(string: picturesArray[i]) else {
//                return
//            }
//
//            if let data = try? Data(contentsOf: url){
//                dataArray.append(data)
//            }
//            else{
//
//            }
//        }
//
//        for i in 0..<dataArray.count {
//
//            picturesCaruoselsImageView.image = UIImage(data: dataArray[i])
//
//
//            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
//            picturesCaruoselsImageView.frame = CGRect(x: xPosition, y: 0, width: picturesCarousel.frame.width, height: picturesCarousel.frame.height)
//
//            picturesCarousel.contentSize.width = picturesCarousel.frame.width * CGFloat(i + 1)
//
//
//        }
//    }
    
}
