//
//  MoneyModel.swift
//  MVVMApp
//
//  Created by Halil Özel on 6.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

// sınıf tanımı
class MoneyModel {
    
    // sınıfa ait değişkenler
    var selling : Double
    var update_date : Date
    var buying : Double
    var full_name : String
    var code : String
    var guncelleme = 1499337521
    
    
    // bu sınıfın elemanları olduğunu belirttik.
    init(selling:Double,update_date:Date,buying:Double,full_name:String,code:String) {
        self.selling = selling
        self.update_date = update_date
        self.buying = buying
        self.full_name = full_name
        self.code = code
    }
    
    // ilk değer atamaları yapıldı.
    init() {
        self.selling = 3.6401
        self.update_date = Date(timeInterval: TimeInterval(guncelleme), since: Date())
        self.buying = 3.6361
        self.full_name = "Amerikan Doları"
        self.code = "USD"
    }
}
