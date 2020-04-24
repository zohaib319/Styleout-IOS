//
//  BuyWatchInstructionsModel.swift
//  Styleout Watches
//
//  Created by Zohaib on 20/04/2020.
//  Copyright © 2020 Zohaib. All rights reserved.
//

import Foundation
class BuyWatchInstructionsModel{
    var image : String?
    var instructions: String?
    var subInstructions: String?
    
    init(image: String, instructions: String, subInstructions: String){
        self.image = image
        self.instructions = instructions
        self.subInstructions = subInstructions
        
    }
}
