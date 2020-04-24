//
//  BuyWatchInstructionsCell.swift
//  Styleout Watches
//
//  Created by Zohaib on 20/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import UIKit
import FSPagerView

class BuyWatchInstructionsCell: FSPagerViewCell {
    @IBOutlet weak var instructionsImage: UIImageView!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var subInstructions: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setInstructions(item: BuyWatchInstructionsModel){
        instructionsImage.image = UIImage(named: item.image!)
        instructions.text = item.instructions
        subInstructions.text = item.subInstructions
        
    }

}
