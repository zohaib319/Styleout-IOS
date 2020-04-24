//
//  QuotationsViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 11/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class QuotationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var quotationsTableView: UITableView!
    var quotationsArray : [QuotationsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting delegates and data source
        quotationsTableView.delegate = self
        quotationsTableView.dataSource = self
        quotationsTableView.tableFooterView = UIView()
//        fetchData()
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotationsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quotationsCellId") as! QuotationsTableViewCell
        
        let item: QuotationsModel
        item = quotationsArray[indexPath.row]
        cell.setQuotation(quotation: item)
        cell.selectionStyle = .none
        return cell
    }
    func fetchData(){
        let itemtoAppend = QuotationsModel(quotationId: 1, watchImage: "https://styleoutwatches.sirv.com/ap-mati-yWTN1/0MdhKkx7hDTHtEsd4NJ8oiroNbzIKSqHmNCLSgfH.png", watchName: "Audemers Piguet", brandName: "Audemers", quotationPrice: "829281282 AED", watchSeries: "Dont Know", quotationStatus: "In Progress")
        let itemtoAppend2 = QuotationsModel(quotationId: 1, watchImage: "https://styleoutwatches.sirv.com/ap-mati-yWTN1/0MdhKkx7hDTHtEsd4NJ8oiroNbzIKSqHmNCLSgfH.png", watchName: "Audemers Piguet", brandName: "Audemers", quotationPrice: "829281282 AED", watchSeries: "Dont Know", quotationStatus: "In Progress")
        let itemtoAppend3 = QuotationsModel(quotationId: 1, watchImage: "https://styleoutwatches.sirv.com/ap-mati-yWTN1/0MdhKkx7hDTHtEsd4NJ8oiroNbzIKSqHmNCLSgfH.png", watchName: "Audemers Piguet", brandName: "Audemers", quotationPrice: "829281282 AED", watchSeries: "Dont Know", quotationStatus: "In Progress")
        
        quotationsArray.append(itemtoAppend)
        quotationsArray.append(itemtoAppend2)
        quotationsArray.append(itemtoAppend3)
        
        quotationsTableView.reloadData()
    }
}
