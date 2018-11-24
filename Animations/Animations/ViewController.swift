//
//  ViewController.swift
//  Animations
//
//  Created by Halil Özel on 24.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1 // sayaç tanımlandı.
    
    @IBOutlet weak var image: UIImageView! // resim tanımı
    
    @IBOutlet weak var button: UIButton! // button tanımı
    
    var timer = Timer() // timer nesnesi tanımlandı.
    
    var isAnimating = false // bool tipinde değişken
    
    
    
    // animate adında bir fonksiyon
    @objc func animate(){
        
        // resimlerini adlarına göre
        image.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
        counter += 1 // counter değerini arttır.
        
        if counter == 41{ // counter değeri 41 olunca
            counter = 0 // counter değerini sıfırla
        }
    }
    
    // buttona tıklanınca resimleri değiştir
    @IBAction func nextImage(_ sender: UIButton) {
        
        if isAnimating{ // false ise
            
            timer.invalidate() // timer'ı geçirsiz yap.
            button.setTitle("Start Animation", for: []) // button başlığı
            isAnimating = false // bool değerini false yap.
            
        }else{ // true ise
            
            // her 0.07 saniye resimleri değiştir
            timer = Timer.scheduledTimer(timeInterval: 0.07, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            button.setTitle("Stop Animation", for: []) // button başlığı
            isAnimating = true // bool değeri true yap.
        }
        
        
        
    }
    
    
    // resmin bir anda gözüküp-gözükmemesi
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0 // alpha değeri sıfıra eşitlendi.
        
        UIView.animate(withDuration: 1, animations: { // 1 saniye olunca
            
            self.image.alpha = 1 // alpha değerini update et
        })
    }
    
    // dışarıdan içeriğe doğru gelen resim
    @IBAction func slideIn(_ sender: Any) {
        
        // resmin hangi koordinatlarda gözükücek
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        // duration değeri 2 olunca
        UIView.animate(withDuration: 2){
            
            // resmin hangi koordinatlarda gözükücek

            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)

        }
    }
    
    // sıfırdan verilen değerine kadar resmin büyümesi
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        UIView.animate(withDuration: 1) { // duration 1 ise
            
            // resim ekranda nasıl gözükücek
            self.image.frame = CGRect(x: self.image.center.x, y: self.image.center.y, width: 300, height: 300)

            
        }
    }
    
}

