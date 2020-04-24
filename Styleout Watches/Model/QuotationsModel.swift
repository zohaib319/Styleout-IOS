//
//  QuotationsModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 11/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

/**
 Model class to store quotations data from api
 */

import Foundation

class QuotationsModel{
    var quotationId: Int?
    var watchImage: String?
    var watchName: String?
    var brandName: String?
    var quotationPrice: String?
    var watchSeries: String?
    var quotationStatus: String?
    
    init(quotationId: Int, watchImage: String, watchName: String,brandName: String,quotationPrice: String, watchSeries: String, quotationStatus: String) {
        self.quotationId = quotationId
        self.watchImage = watchImage
        self.watchName = watchName
        self.brandName = brandName
        self.quotationPrice = quotationPrice
        self.watchSeries = watchSeries
        self.quotationStatus = quotationStatus
    }
}
