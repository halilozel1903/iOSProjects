//
//  ViewController.swift
//  Segues
//
//  Created by Halil Özel on 21.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var username = "" // string türünde bir değişken tanımı
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // segue başlamadan önce çalışacak fonksiyon
        
        if segue.identifier == "fromFirstToSecond"{
            
            // değişken gibi işleme tabi tutmak için yapıldı.
            
            let destinationVC = segue.destination as! SecondViewController // artık bu yapıya ait tüm özelliklere erişim mevcut hale geldi.
            
            destinationVC.name = username // ikinci ekrandaki name değişkeni ile birinci ekrandaki username değeri eşleştirildi.
            
        }
    }


    @IBAction func saveClicked(_ sender: Any) {
        
        username = nameText.text! // alınan değer text içeriğindeki değere eşit olacak
        
        performSegue(withIdentifier: "fromFirstToSecond", sender: nil) // segue çalışması için gerekli metod
    }
    
}

