//
//  ViewController.swift
//  UIViewControllerLifecycle
//
//  Created by Halil Özel on 27.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // metodların çalışması için mutlaka super metodu eklenmelidir.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         Mutlaka bu metod 1 defa çağrılmalıdır.
         App tarafından otomatik çağrılır.
         Ekran açıldığında yüklenmesi gereken herşey burada çağrılmalıdır.
 
        */
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        /*
 
         Burası view çağrıldığında çalışır.
         tab bar hide
         navigation title,back yazısı değiştirme
         eklenen datanın tekrardan yüklenmesi
        */
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /*
         
         animasyon işlemleri
         loading işlemleri
         
         */
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        /*
 
         save işlemleri
         görevlerin tamamlanması gerekiyor.
         last actions burda yapılır.
         
        */
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        /*
 
         ekrandan view kaybolur.
         ek işlem varsa burda yapılır.
        */
    }
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

