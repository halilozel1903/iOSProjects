//
//  ViewController.swift
//  WebViewApp
//
//  Refactored by Halil Özel on 14.07.2022.
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

