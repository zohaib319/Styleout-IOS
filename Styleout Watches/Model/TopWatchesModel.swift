//
//  TopWatchesModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 13/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import Foundation
class TopWatchesModel{
    var watchImage: String?
    var watchName: String?
    var watchStatus : String?
    
    init(watchImage: String, watchName: String, watchStatus: String) {
        self.watchImage = watchImage
        self.watchName = watchName
        self.watchStatus = watchStatus
    }
}
