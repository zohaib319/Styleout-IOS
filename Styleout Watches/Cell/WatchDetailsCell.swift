//
//  WatchDetailsCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 12/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class WatchDetailsCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    func setWatchDetailsCellData(data: WatchConditionsModel){
        title.text = data.title!
        subTitle.text = data.subTitle!
    }

}
