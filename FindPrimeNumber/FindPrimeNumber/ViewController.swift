//
//  ViewController.swift
//  FindPrimeNumber
//
//  Created by Halil Özel on 19.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   // asal sayıyı bulma fonksiyonu
    @IBAction func findNumber(_ sender: Any) {
        
        if let userEnteredString = numberTextField.text{
            
            let userEnteredInteger = Int(userEnteredString)
            
            if let number = userEnteredInteger{
                
                var isPrime = true
                
                if number == 1{
                    isPrime = false
                }
                
                var i = 2
                
                while i < number{
                    if number % i == 0{
                        isPrime = false
                    }
                }
                
                if isPrime{ // asal sayı ise
                    resultLabel.text = "\(number) is prime number"
                }else{ // asal sayı değilse
                    resultLabel.text = "\(number) is not prime number"
                }
            }else{ // sayı girilmezse
                resultLabel.text = "Please enter a positive whole number"
            }
        }
    }
    
}

