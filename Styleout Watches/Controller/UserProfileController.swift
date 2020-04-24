//
//  UserProfileController.swift
//  Styleout Watches
//
//  Created by Zohaib on 23/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class UserProfileController: UIViewController {
    
    
    /**
     IB Outlets
     */
    @IBOutlet weak var profileTableView: UITableView!
    
    /**
     Global variables
     */
    var userProfileActionsArray : [UserProfileActionsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        let action1 = UserProfileActionsModel(id: 1, image: "watch", title: "Settings", subTitle: "Currency")
        let action2 = UserProfileActionsModel(id: 2, image: "watch", title: "Info", subTitle: "Privacy Policy and Terms Of Use")
        
        userProfileActionsArray.append(action1)
        userProfileActionsArray.append(action2)
        profileTableView.reloadData()
        

    }

}
extension UserProfileController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else{
            return userProfileActionsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCellId") as! UserProfileCell
            cell.setUserInfoCell()
            cell.selectionStyle = .none
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "userProfileActionCellId") as! UserProfileActionCell
            let item: UserProfileActionsModel
            item = userProfileActionsArray[indexPath.row]
            cell.setUserProfileActionCell(actionitem: item)
            cell.selectionStyle = .none
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        else{
            return 80
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            // open login
        }
        else if indexPath.section == 1{
            if indexPath.row == 0 {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let currenciesVC = storyBoard.instantiateViewController(withIdentifier: "CurrenciesViewController") as! CurrenciesViewController
                navigationController?.pushViewController(currenciesVC, animated: true)
            }
            else{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let privacyPolicyVC = storyBoard.instantiateViewController(withIdentifier: "PrivacyPolicyController") as! PrivacyPolicyController
                navigationController?.pushViewController(privacyPolicyVC, animated: true)
            }
        }
    }
    
    
    
    
    
    
}
