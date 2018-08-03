//
//  ViewController.swift
//  AlertViewApp
//
//  Created by Halil Özel on 3.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   // alertview ile ilgili işlemler yapılıyor.
    @IBAction func alertViewShow(_ sender: Any) {
        
        // alert nesnesi tanımlandı.
        let alert = UIAlertController(title: "Başlık", message: "Alert View örneğidir.", preferredStyle: .alert)
        
        
        // default butonu ile ilgili işlemler
        alert.addAction(UIAlertAction(title: "1.button", style: .default, handler: { (action) in
            print("1.butona basıldı.")
        }))
        
        
        // destructive butonu ile ilgili işlemler
        alert.addAction(UIAlertAction(title: "2.button", style: .destructive, handler: { (action) in
            print("2.butona basıldı.")
        }))
        
        
        // cancel butonu ile ilgili işlemler
        alert.addAction(UIAlertAction(title: "Cancel butonu", style: .cancel, handler: { (action) in
            print("Cancel butonuna basıldı.")
        }))
        
        
        // alert view gösterme işlemi
        self.present(alert,animated: true,completion: nil)
        
        
    }
    

}

