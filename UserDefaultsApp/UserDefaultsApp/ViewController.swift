//
//  ViewController.swift
//  UserDefaultsApp
//
//  Refactored by Halil Özel on 15.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberField: UITextField!
    
    // kaydetme butonu işlemleri
    @IBAction func save(_ sender: Any) {
        
        // UserDefaults olusturma
        UserDefaults.standard.set(numberField.text, forKey: "number")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // o değeri bir değişkene atama
        let numberObject = UserDefaults.standard.object(forKey: "number")
        
        // optional değerlikten kurtarma
        if let number = numberObject as? String{
            
            // textField değerine yazma
            numberField.text = number
        }
        
        
        /*
         
         // String Kullanımı
         
         UserDefaults.standard.set("Halil", forKey: "name") // key-value ikilisi tanımlandı.
         let nameObject = UserDefaults.standard.object(forKey: "name") // nameObject değişkenine atandı.
         
         if let name = nameObject as? String{ // unwrapping
         print(name)
         }
         
         
         // Array Kullanımı
         
         let array = [1,9,9,7] // int türünde array
         
         UserDefaults.standard.set(array, forKey: "array") // UserDefaults olusturma
         
         let arrayObject = UserDefaults.standard.object(forKey: "array") // UserDefaults okuma
         
         
         if let myArray = arrayObject as? NSArray{ // unwrapping islemi
         
         print(myArray) // elemanları yazdırma
         }
         
         */
        
        
    }
}

