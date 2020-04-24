//
//  QuotationsTableViewCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 11/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit

class QuotationsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageLoader: UIActivityIndicatorView!
    @IBOutlet weak var watchName: UILabel!
    @IBOutlet weak var watchSeries: UILabel!
    @IBOutlet weak var quotationStatus: UILabel!
    @IBOutlet weak var watchImage: UIImageView!
    @IBOutlet weak var quotationPrice: UILabel!
    
    
    func setQuotation(quotation: QuotationsModel){
        
        watchName.text = quotation.watchName!
        quotationPrice.text = quotation.quotationPrice!
        watchSeries.text = quotation.watchSeries!
        quotationStatus.text = quotation.quotationStatus!
        
        
        guard let url = URL(string: quotation.watchImage!) else {
            return
        }
        self.imageLoader.startAnimating()
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                self.watchImage.image = UIImage(data: data)
                self.imageLoader.stopAnimating()
                self.imageLoader.isHidden = true
            }
        }//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        else{
            DispatchQueue.main.async {
                self.watchImage.image = UIImage(named: "defaultimage")
                self.imageLoader.stopAnimating()
                self.imageLoader.isHidden = true
            }
        }
        

        
    }
    
    
    
}
