//
//  FiltersViewController.swift
//  Styleout Watches
//
//  Created by Zohaib on 14/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    @IBOutlet weak var filtersTableView: UITableView!
    
    /**
     global variables
     */
    var additionalFiltersArray : [FiltersModel] = []
    let filterPreferences = UserDefaults(suiteName: "FilterPreferences")
    let transition = CATransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /**
         create transition
         */
        transition.duration = 0.3
        transition.type = CATransitionType(rawValue: "push")
        transition.subtype = CATransitionSubtype.fromBottom
        
        /**
         setting table view delagets and data sources
         */
        filtersTableView.delegate = self
        filtersTableView.dataSource = self
        loadFiltersData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        self.title = "Refine Search"
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        self.navigationController?.view.layer.add(transition,forKey: kCATransition)
        navigationController?.popViewController(animated: false)
    }
    func loadFiltersData(){
            print("inside")
            if let path = Bundle.main.path(forResource: "AdditionalFiltersTitles", ofType: "json") {
                do{
                    let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                    do{
                        let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                        if let filtersData : [NSDictionary] = jsonResult["additionalfilters"] as? [NSDictionary] {
                            for item in filtersData {
                                let id = item["id"]!
                                let title = item["title"]!
                                print(title)
                                let filterItemToAppend = FiltersModel(id: id as! Int, title: title as! String)
                                additionalFiltersArray.append(filterItemToAppend)
                            }
                            self.filtersTableView.reloadData()
                            
                        }
                    }catch{
                    }
                    
                }catch{
                }
            }
            
        }
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "topFiltersCellId") as! TopFiltersCell
            cell.selectionStyle = .none
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "additionalFiltersCellId") as! AdditionalFiltersCell
            let item : FiltersModel
            item = additionalFiltersArray[indexPath.row]
            cell.setTitle(item: item)
            cell.selectionStyle = .none
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.textAlignment = .center
            label.font = UIFont(name: "Roboto-Thin.ttf", size: 12)
            label.text = "Brands";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = .clear
            return view
        }
        else{
            let view = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:40))
            let label = UILabel(frame: CGRect(x:10, y:5, width:tableView.frame.size.width, height:40))
            label.textAlignment = .center
            label.font = UIFont(name: "Roboto-Thin.ttf", size: 12)
            label.text = "Additional Filters";
            label.textColor = UIColor(named: "tableViewHeaderTextColor")
            view.addSubview(label);
            view.backgroundColor = .clear
            return view
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return 2
        }
        else {
            return additionalFiltersArray.count
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let subFiltersVC = storyBoard.instantiateViewController(withIdentifier: "SubFiltersViewController") as! SubFiltersViewController
        if indexPath.section == 0 {
            filterPreferences?.set(true, forKey: "loadBrandsSeries")
            filterPreferences?.set("Brand", forKey: "selected_filter_title")
            
        }
        else {
            filterPreferences?.set(false, forKey: "loadBrandsSeries")
            filterPreferences?.set(additionalFiltersArray[indexPath.row].id, forKey: "selected_filter_id")
            filterPreferences?.set(additionalFiltersArray[indexPath.row].title, forKey: "selected_filter_title")
            
        }
        navigationController?.pushViewController(subFiltersVC, animated: true)
        
    }
    
}
