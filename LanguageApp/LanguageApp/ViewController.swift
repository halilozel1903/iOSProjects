//
//  ViewController.swift
//  LanguageApp
//
//  Created by Halil Özel on 4.09.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0


class ViewController: UIViewController {

    let languageCodes = ["en","tr"] // değişikliğe uğrayacak dillerin kodları
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // dili değiştirmek için kullanılan metod
    @IBAction func changeLanguage(_ sender: Any) {
       ActionSheetMultipleStringPicker.show(withTitle: NSLocalizedString("Change Language Title", comment: "") ,
        rows: [["English","Türkçe"]],
        initialSelection: [0],
        doneBlock: { (picker, indexes, values) in
            let index = indexes?[0] as! Int
            
            UserDefaults.standard.set(self.languageCodes[index], forKey: "AppleLanguages")
            
            UserDefaults.standard.synchronize()
            
            print("Uygulamayı açıp kapayınız dili değişecektir.")
            
           // print("seçilen dil : \(index)")
            
            return
       },
        cancel: { (ActionMultipleStringCancelBlock) in return
            
       },
        origin: sender)
        
        
        
    }
    

}

