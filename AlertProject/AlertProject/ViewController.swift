//
//  ViewController.swift
//  AlertProject
//
//  Created by Halil Özel on 25.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordAgainTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func signClicked(_ sender: Any) {
        
        if usernameTxt.text == "" && passwordTxt.text == "" {
            
            let alert = UIAlertController(title: "Alert", message: "Username and Password is empty", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }else if passwordTxt.text == ""{
            
            let alert = UIAlertController(title: "Alert", message: "Password is empty", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }else if usernameTxt.text == ""{
            
            let alert = UIAlertController(title: "Alert", message: "Username is empty", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }else if passwordTxt.text != passwordAgainTxt.text{
            
            let alert = UIAlertController(title: "Alert", message: "Passwords are not matching", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "Alert", message: "User Signed Up", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
   
    @IBAction func btnClicked(_ sender: Any) {
        
        // alert dialog ile ilgili ayarlar yapıldı.
        let alert = UIAlertController(title: "Alert", message: "Very critical alert", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil) // tamam butonu tanımı
        
        alert.addAction(okButton) // action eklendi.
        
        // yapıları görüntülemede kullanılır.
        self.present(alert, animated: true, completion: nil) // completion : işlem sonrası birşeyler yapılacak mı ?
        
        
    }
    
    
    @IBAction func alertClicked(_ sender: Any) {
        
        // 'UIAlertView' iOS 9.0'da kullanımdan kaldırıldı. UIAlertController yerine onun yerine bir UIAlertControllerStyleAlert tercih edilir.
        
        let alert = UIAlertView()
        alert.title = "Alert Başlığı" // alert başlığı
        alert.message = "Alert mesaj içeriği" // alert mesaj
        alert.addButton(withTitle: "Tamam") // alert için buton eklendi.
        alert.show() // show metodu ile işlem tamamlandı.
    }
    
    
    @IBAction func cokluAlertClicked(_ sender: Any) {
        
        let alerts = UIAlertView(title: "Başlık", message: "Mesaj içeriği", delegate: self, cancelButtonTitle: "İptal",otherButtonTitles:"Button1","Button2")
        alerts.show()
    }
    
    @IBOutlet weak var labelAlert: UILabel!
    
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        
        if buttonIndex == 0 {
            labelAlert.text = "İptal butonuna tıklandı."
        }else if buttonIndex == 1{
            labelAlert.text = "Button1 tıklandı."
        }else{
            labelAlert.text = "Button2 tıklandı."
        }
    }
    
    
    
    

}

