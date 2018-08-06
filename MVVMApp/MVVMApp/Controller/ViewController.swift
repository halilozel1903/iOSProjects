//
//  ViewController.swift
//  MVVMApp
//
//  Created by Halil Özel on 6.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // değişken tanımlamaları yapıldı.
    @IBOutlet weak var paraBirimAdi: UILabel!
    @IBOutlet weak var paraBirimKodu: UILabel!
    @IBOutlet weak var alisFiyati: UILabel!
    @IBOutlet weak var satisFiyati: UILabel!
    @IBOutlet weak var guncellemeTarihi: UILabel!
    
    
    var moneyViewModel = MoneyViewModel() // nesne olusturuldu.
    
    // ekrana yazdırılacak bilgiler ayarlandı.
    func printScreen(){
        paraBirimAdi.text = moneyViewModel.moneyModel.full_name
        paraBirimKodu.text = moneyViewModel.moneyModel.code
        alisFiyati.text = moneyViewModel.buyingString
        satisFiyati.text = moneyViewModel.sellingString
        guncellemeTarihi.text = moneyViewModel.dateString
    }
    
    // ekran açıldığı anda çalışacak metod
    override func viewWillAppear(_ animated: Bool) {
        printScreen()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   


}

