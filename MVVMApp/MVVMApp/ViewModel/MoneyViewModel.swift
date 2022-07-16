//
//  MoneyViewModel.swift
//  MVVMApp
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

// double ve date değerlere ulaşmak için bir class tanımlandı.
class MoneyViewModel {
    
    var moneyModel = MoneyModel() // nesne üretildi.
    
    // satıs değeri ile ilgili işlem
    var sellingString : String{
        return String(moneyModel.selling)
    }
    
    // alıs değeri ile ilgili işlem
    var buyingString : String{
        return String(moneyModel.buying)
    }
    
    // tarih değeri ile ilgili işlem
    var dateString : String{
        let date = Date(timeIntervalSince1970: TimeInterval(moneyModel.guncelleme))
        return String(describing:date)
    }
}
