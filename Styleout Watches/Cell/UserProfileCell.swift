//
//  UserProfileCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 23/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class UserProfileCell: UITableViewCell {

    @IBOutlet weak var profilePicCircle: UIView!
    @IBOutlet weak var profileAvatar: UIImageView!
    @IBOutlet weak var userFullName: UILabel!
    
    func setUserInfoCell(){
        profilePicCircle.layer.masksToBounds = true
        profilePicCircle.layer.cornerRadius = profilePicCircle.bounds.width / 2
        profileAvatar.layer.masksToBounds = true
        profileAvatar.layer.cornerRadius = profileAvatar.bounds.width / 2
        
        profileAvatar.image = UIImage(named: "watch")
        userFullName.text = "Zohaib Ahmad"
    }
    
    
    
}
