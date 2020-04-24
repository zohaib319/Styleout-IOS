//
//  WatchConditionsCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 12/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class WatchConditionsCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    func setWatchConditionsCellData(data: WatchConditionsModel){
        title.text = data.title!
        subTitle.text = data.subTitle!
    }
    
}
