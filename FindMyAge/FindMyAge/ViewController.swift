//
//  ViewController.swift
//  FindMyAge
//
//  Updated by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var txtYearOfBirth: UITextField!
    @IBOutlet weak var labelShowAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnFindAge(_ sender: Any) {
        
        let yearOfBirth = Int (txtYearOfBirth.text!)
        
        // tarih değerlerini alıyoruz.
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        // tarih değerinden doğum yılını çıkartıp sonucu buluyoruz.
        let personAge = year - yearOfBirth!
        
        // let personAge = 2018 - yearOfBirth!
        
        // ekranda gösteriyoruz.
        labelShowAge.text = "Your age is \(personAge) years old"
    }
    
    // ekranda herhangibir alana basılınca klavye kapanır.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // return tuşuna basınca klavye kapanacak.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
    }
    
}

