//
//  ViewController.swift
//  ControllingTheKeyboard
//
//  Updated by Halil Özel on 15.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // klavyeyi kapatmak için ekranın herhangi bir yerine tıklamak yeterli olacaktır.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //return tuşuna basınca klavye kapansın.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // ilk durumu terk et
        return true // değeri true döndür.
    }
}

