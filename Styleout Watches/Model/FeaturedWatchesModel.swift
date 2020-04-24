//
//  FeaturedWatchesModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 09/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import Foundation

class FeaturedWatchesModel{
    var watchImage: String?
    var watchName: String?
    var watchDescription : String?
    
    init(watchImage: String, watchName: String, watchDescription: String) {
        self.watchImage = watchImage
        self.watchName = watchName
        self.watchDescription = watchDescription
        
    }
}
