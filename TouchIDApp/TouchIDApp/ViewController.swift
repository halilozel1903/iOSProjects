//
//  ViewController.swift
//  TouchIDApp
//
//  Created by Halil Özel on 15.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    let authContext = LAContext()
    var error : NSError?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func showPhoto(_ sender: Any) {
        
        // eğer touch id özelliği varsa aşağıdaki işlemleri yap
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            //parmak izini kontrol etme ve mesaj verme
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "fotolarına erişmemiz gerekiyor.") { (success, error) in
                
                if error == nil{ // hata yoksa
                    
                    if success == true{ // işlemler başarılı ise
                        
                        // resimlerin bulunduğu sayfaya geç
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PhotosStoryboardID")
                        self.show(vc!, sender: self)
                    }else{ // parmak izi hatalı ise
                        print("parmak iziniz uymadı.") // mesaj yazdır.
                    }
                }
            }
            
        }else{ // touch id özelliği yoksa aşağıdaki işlemleri yap
            
            print("Touch id özelliği bulunamadı !!!")
        }
        
    }
    
}

