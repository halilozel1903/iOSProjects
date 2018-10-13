//
//  ViewController.swift
//  DownloadingWebContent
//
//  Created by Halil Özel on 13.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         
        if let url = URL(string: "https://www.stackoverflow.com"){ // url
            
            webView.load(URLRequest(url: url)) // yükle
            
            webView.loadHTMLString("<h1>Hello Guys!</h1>", baseURL: nil) // herhangibir sayfaya yazı
            
        }*/
        
        
        if let url = URL(string: "https://www.apple.com"){ // url tanımı - unwrapping işlemi
            
            let request = NSMutableURLRequest(url: url) // değişken değerde url
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { // session işlemleri
                
                data, response, error in
                
                if error != nil{ // hata nil değerine eşit değilse
                    
                    print(error!) // hata
                    
                }else{
                    if let unwrappingData = data{ // data değerine eşitse
                        
                        // Strin değerleri al encoding işlemi yap.
                        let dataString = NSString(data: unwrappingData, encoding: String.Encoding.utf8.rawValue)
                        
                        // console kısmına yazdır.
                        print(dataString!)
                        
                        DispatchQueue.main.sync {
                            
                            // Update UI
                        }
                    }
                }
            }
            
            task.resume() // task başlatıldı.
        }
        
        
        
    }


}

