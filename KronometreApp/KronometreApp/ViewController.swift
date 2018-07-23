//
//  ViewController.swift
//  KronometreApp
//
//  Created by Halil Özel on 23.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Variables
    var second = 0
    var timer = Timer() // timer tanımlandı.
    
    // MARK: IBOutlets
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    // MARK: IBActions
    @IBAction func startCronometer(_ sender: Any) {
        
        // saniye 0 ise bir defa başlat tuşuna basabiliriz.
        if second == 0 {
             timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(increase1), userInfo: nil, repeats: true)
        }
        
       
    }
    
    
    @IBAction func stopCronometer(_ sender: Any) {
        timer.invalidate() // timer'ı durdur, geçersiz kıl
    }
    
    
    // değerini 10 arttır.
    @IBAction func increase10(_ sender: Any) {
        
        second += 10
        scoreLabel.text = String(second)
    }
    
    // değerini 10 azalt.
    @IBAction func decrease10(_ sender: Any) {
        
        // zaman negatif olmayacağı için kosul ekledik.
        if second >= 10{
            second -= 10
            scoreLabel.text = String(second)
        }
       
    }
    
    // değeri resetle
    @IBAction func resetCronometer(_ sender: Any) {
        
        second = 0 // saniyeyi sıfırla
        scoreLabel.text = String(second) // değeri ekrana yaz
        timer.invalidate() // timer'ı durdur.
        
    }
    
    
    
    @objc func increase1(){ // 1 saniyede bir çalışacak metod
        second += 1 // saniyeyi bir arttır.
        scoreLabel.text = String(second) // saniyeyi ekranda göster
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }




}

