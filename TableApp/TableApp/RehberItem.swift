//
//  RehberItem.swift
//  TableApp
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation
import UIKit

class RehberItem {
    
    let name:String?
    let status:Bool?
    let profileImg:UIImage?
    
    init(name:String, status:Bool, profileImg:UIImage) {
        self.name = name
        self.status = status
        self.profileImg = profileImg
    }
}
