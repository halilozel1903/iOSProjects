//
//  ViewController.swift
//  KlavyeyiKontrolEtme
//
//  Updated by Halil Özel on 17.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1{
            print("ad text  field'i kapandı.")
        }else if textField.tag == 2{
            print("soyad text  field'i kapandı.")
        }else{
            print("email text  field'i kapandı.")
        }
        
        textField.resignFirstResponder()
        return true
    }
}

