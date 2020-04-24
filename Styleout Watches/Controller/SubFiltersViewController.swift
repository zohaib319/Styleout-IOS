//
//  SubFiltersViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 15/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class SubFiltersViewController: UIViewController {
    
    @IBOutlet weak var subFiltersTableView: UITableView!
    /**
     Global variables
     */
    let filterPreferences = UserDefaults(suiteName: "FilterPreferences")
    var subFiltersArray : [FiltersModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllerTitle = (filterPreferences?.string(forKey: "selected_filter_title") ?? "")
        navigationController?.navigationBar.topItem?.title = ""
        self.title = controllerTitle
        
        subFiltersTableView.delegate = self
        subFiltersTableView.dataSource = self
        
        let loadBrandsSeriesBool = (filterPreferences?.bool(forKey: "loadBrandsSeries") ?? false)
        if loadBrandsSeriesBool {
            loadBrandsSeriesFilters()
        }
        else{
            loadAdditionalSubFilters()
        }
    }
    func loadBrandsSeriesFilters(){
        let itemToAppend = FiltersModel(id: 1, title: "Test")
        subFiltersArray.append(itemToAppend)
        subFiltersTableView.reloadData()
    }
    func loadAdditionalSubFilters(){
        let selectedFilterId = (filterPreferences?.integer(forKey: "selected_filter_id") ?? 1)
        if let path = Bundle.main.path(forResource: "AdditionalFiltersSubTitles", ofType: "json") {
            do{
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do{
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let filtersData : [NSDictionary] = jsonResult["additionalfilterssubtitles"] as? [NSDictionary] {
                        for item in filtersData {
                            let id = item["id"]! as! Int
                            let title = item["title"]! as! String
                            let parentId = item["parent_id"]! as! Int
                            if selectedFilterId == parentId {
                                let itemToAppend = FiltersModel(id: id, title: title)
                                subFiltersArray.append(itemToAppend)
                            }
                        }
                        self.subFiltersTableView.reloadData()
                        
                    }
                }catch{
                }
                
            }catch{
            }
        }
    }
}
extension SubFiltersViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subFiltersArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subFiltersCellId") as! SubFiltersCell
        let item : FiltersModel
        item = subFiltersArray[indexPath.row]
        cell.setSubFilter(item: item)
        cell.selectionStyle = .none
        cell.checkButton.addTarget(self, action: #selector(checkBoxClicked(_ :)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
        
    }
    @objc func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
