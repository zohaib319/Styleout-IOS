//
//  UserProfileActionCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 23/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class UserProfileActionCell: UITableViewCell {
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var actionImage: UIImageView!
    @IBOutlet weak var actionTitle: UILabel!
    @IBOutlet weak var actionSubTitle: UILabel!
    
    func setUserProfileActionCell(actionitem: UserProfileActionsModel){
        actionTitle.text = actionitem.title!
        actionSubTitle.text = actionitem.subTitle!
    }

}
