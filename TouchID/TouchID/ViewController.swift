//
//  ViewController.swift
//  TouchID
//
//  Refactored by Halil Özel on 15.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import LocalAuthentication

/*
 
 Bir LAContext nesnesi bir kimlik doğrulama bağlamını temsil eder.
 LAContext sınıfı, kimlik doğrulama ilkelerini ve erişim denetimlerini değerlendirmek,
 kimlik bilgilerini yönetmek ve kimlik doğrulama bağlamlarını geçersiz kılmak için programlı bir arabirim sağlar.
 Kimlik doğrulama ilkeleri, kimlik doğrulama ilkelerini değerlendirmek için kullanılır
 ve uygulamaların kullanıcının biyometrik yöntemleri kullanarak kendilerini doğrulamasını isteme izni verir.
 
 */

class ViewController: UIViewController {
    
    
    @IBOutlet weak var statusText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let authContext = LAContext()
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Gerçekten siz misiniz?") { (success, error) in
                
                if success == true{ // işlem doğruysa
                    
                    self.statusText.text = "Success" // mesaj yaz
                    
                }else{ // işlem yanlışsa
                    self.statusText.text = "No" // mesaj yaz
                } 
            }
        }
    }
}

