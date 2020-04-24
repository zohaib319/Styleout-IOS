//
//  CurrenciesViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 24/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController {
    @IBOutlet weak var currenciesTableView: UITableView!
    
    var currenciesArray: [CurrenciesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currenciesTableView.delegate = self
        currenciesTableView.dataSource = self
        
        loadCurrencyJSON()
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    func loadCurrencyJSON(){
        if let path = Bundle.main.path(forResource: "currencies", ofType: "json") {
            do{
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do{
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let currenciesData : [NSDictionary] = jsonResult["currencies"] as? [NSDictionary] {
                        for item in currenciesData {
                            let id = item["id"]! as! Int
                            let title = item["title"]! as! String
                            let symbol = item["symbol"]! as! String
                            
                            let currencyitemToAppend = CurrenciesModel(id: id, title: title, shortTerm: symbol)
                            
                            currenciesArray.append(currencyitemToAppend)
                            
                        }
                        self.currenciesTableView.reloadData()
                        
                    }
                }catch{
                }
                
            }catch{
            }
        }
    }

}
extension CurrenciesViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currenciesCellId") as! CurrenciesCell
        let currencyItem : CurrenciesModel
        currencyItem = currenciesArray[indexPath.row]
        cell.setCurrency(currencyItem: currencyItem)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
