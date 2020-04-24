//
//  UserProfileActionsModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 24/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import Foundation
class UserProfileActionsModel{
    var id: Int?
    var image: String?
    var title: String?
    var subTitle: String?
    
    init(id: Int,image: String, title: String, subTitle: String) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
    }
}
