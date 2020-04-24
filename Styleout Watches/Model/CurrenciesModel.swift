//
//  CurrenciesModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 24/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import Foundation
class CurrenciesModel{
    var id: Int?
    var title: String?
    var shortTerm: String?
    
    init(id: Int, title: String, shortTerm: String) {
        self.id = id
        self.title = title
        self.shortTerm = shortTerm
    }
}
