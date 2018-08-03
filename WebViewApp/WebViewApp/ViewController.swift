//
//  ViewController.swift
//  WebViewApp
//
//  Created by Halil Özel on 3.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://www.google.com.tr"){ // optional olmasın diye
            
            let request = URLRequest(url: url) // istek oluşturduk.
            
            webView.load(request) // yükleme
            
        }
        
    }

    
}

