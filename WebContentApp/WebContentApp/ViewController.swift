//
//  ViewController.swift
//  WebContentApp
//
//  Created by Halil Özel on 4.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // url bilgisi
        let url = URL(string: "https://google.com.tr")
        
        // istek oluşturma
        let request = URLRequest(url: url!)
        
        // görev oluşturma
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // hata yoksa
            if error == nil{
                
                // data değerini optional değerden kurtarma
                if let incomingData = data{
                    
                    // gelen veri yazdırılır.
                    print(incomingData)
                    
                    DispatchQueue.main.sync(execute: {
                        print("burada gelen data gösterilir.")
                    })
                }
            }else{ // hata varsa
               print("hata oluştu") // hata mesajı verilir.
            }
            
        }
        
        task.resume() //Askıya alınmışsa, görevi devam ettirir.
            
        }
        
    }


