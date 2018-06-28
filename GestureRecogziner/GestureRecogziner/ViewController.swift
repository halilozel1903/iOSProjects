//
//  ViewController.swift
//  GestureRecogziner
//
//  Created by Halil Özel on 28.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! // image view tanım
    
    @IBOutlet weak var etFruit: UILabel! // label tanımı
    
    var isFruit = true // resimlerin değişmesi için bir bool türünde değişken tanımlandı.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true // tıklanabilirlik özelliği eklendi.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.changePic))
        imageView.addGestureRecognizer(gestureRecognizer) // Ekrana yapılan dokunmaları takip eden metoddur.
        
    }
    
    
    @objc func changePic() { // resim ile ilgili işlemler için metod oluşturuldu.
        
        if isFruit == true{ // eğer true ise
            
            imageView.image = UIImage(named: "strawberry.jpg") // image değerini çilek yap
            etFruit.text = "Strawberry" // text değerine çilek yaz
            isFruit = false // isFruit değerini false yap
            
        }else if isFruit == false{ // false ise
            imageView.image = UIImage(named: "plum.jpg") // image değerini erik yap
            etFruit.text = "Green Plum" // text değerine yeşil erik yaz
            isFruit = true //  isFruit değerini true yap
        }
        
    }

   

}

