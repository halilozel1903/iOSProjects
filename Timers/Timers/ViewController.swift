//
//  ViewController.swift
//  Timers
//
//  Created by Halil Özel on 28.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerCounter: UILabel!
    
    var timer = Timer() // timer nesnesi tanımlandı.
    
    var counter = 0 // sayac tanımlandı.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counter = 10 // counter başlangıc değeri
        
        timerCounter.text = String(counter) // timer counter değeri yazdırılır.
        
        /*
 
         timeInterval : kaç saniye aralıkta devam edecek
         
         target : Bir zamanlayıcı oluşturur ve varsayılan çalışma modunda geçerli çalışma döngüsünde zamanlar.
         
         userInfo : bilgi verilecek mi ?
         
         repeats : tekrar edecek mi ?
         
         selector : işlemle ilgili fonksiyon eklenir.
         
          */
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction(){
        
        timerCounter.text = String(counter) // label değerine sayac değeri yazılır
        counter = counter - 1 // sayac değeri 1 azaltılır.
        
        if counter == 0 { // eğer sayaç 0 ise
            timer.invalidate() // zamanı durdur.
            timerCounter.text = "Time's Off" // zaman doldu mesajı
        }
        
    }
    
    

    


}

