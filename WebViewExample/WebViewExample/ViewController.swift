//
//  ViewController.swift
//  WebViewExample
//
//  Created by Halil Özel on 13.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate {

    @IBOutlet weak var backButton: UIButton! // geri button
    @IBOutlet weak var forwardButton: UIButton! // ileri button
    @IBOutlet weak var webView: WKWebView! // web gösterimi
    @IBOutlet weak var textField: UITextField! // text değeri - url
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        textField.delegate = self // bu sınıfa ait olduğunu gösterdik.
        webView.navigationDelegate = self // bu sınıfa ait olduğunu gösterdik.
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

        let urlString : String = "https://www.apple.com" // url değeri
        let url : URL = URL(string: urlString)! // unwrapping işlemi
        let urlRequest : URLRequest = URLRequest(url: url) // request işlemi
        webView.load(urlRequest) // load işlemi
        
        textField.text = urlString // text değerine ekleme
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString : String = textField.text! // text değerini alır.
        let url : URL = URL(string: urlString)! // url değerine eşitlenir.
        let urlRequest : URLRequest = URLRequest(url: url) // istek tanımlanır.
        webView.load(urlRequest) // istek yüklenir.
        
        textField.resignFirstResponder() // bulunan durumdan diğerine geçiş sağlanır.
        
        return true
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        if webView.canGoBack{ //  geriye gidebiliyorsa
            webView.goBack() // web kısmında geriye git.
        }
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        
        if webView.canGoForward{ //  ileriye gittiyse
            webView.goForward() // ileriye git
        }
    }
    
    
    // navigation kısmındaki button işlemleri
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        backButton.isEnabled = webView.canGoBack // geriButton enabled ise geri kısmını işle
        forwardButton.isEnabled = webView.canGoForward // ileriButton aktifse onu işle
        
        textField.text = webView.url?.absoluteString
    }
    
   
    
}

