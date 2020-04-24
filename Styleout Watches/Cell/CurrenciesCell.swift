//
//  CurrenciesCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 24/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class CurrenciesCell: UITableViewCell {
    
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyShortTerm: UILabel!
    
    func setCurrency(currencyItem: CurrenciesModel){
        currencyName.text = currencyItem.title!
        currencyShortTerm.text = currencyItem.shortTerm!
    }
    
}
