//
//  ViewController.swift
//  KlavyeyiKontrolEtme
//
//  Created by Halil Özel on 23.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

