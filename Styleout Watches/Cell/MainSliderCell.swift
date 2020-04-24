//
//  MainSliderCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 20/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit
import FSPagerView

class MainSliderCell: FSPagerViewCell {
    @IBOutlet weak var mainSliderImage: UIImageView!
    @IBOutlet weak var mainSliderDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setSlide(slide: MainSliderModel){
        mainSliderImage.image = UIImage(named: slide.image!)
        mainSliderDescription.text = slide.description!
    }
    
    

}
