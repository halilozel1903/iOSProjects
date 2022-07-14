//
//  ViewController.swift
//  Calculator
//
//  Refactored by Halil Özel on 14.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var newOperation = true
    
    func addNumberToInput(number : String)   {
        
        var textNumber = String(numberLabel.text!)
        
        if newOperation {
            textNumber = ""
            newOperation = false
        }
        
        textNumber = textNumber + number
        numberLabel.text = textNumber
        
    }
    
    
    @IBAction func button0(_ sender: Any) {
        addNumberToInput(number: "0")
    }
    
    @IBAction func button1(_ sender: Any) {
        addNumberToInput(number: "1")
    }
    
    @IBAction func button2(_ sender: Any) {
        addNumberToInput(number: "2")
    }
    
    @IBAction func button3(_ sender: Any) {
        addNumberToInput(number: "3")
    }
    
    @IBAction func button4(_ sender: Any) {
        addNumberToInput(number: "4")
    }
    
    @IBAction func button5(_ sender: Any) {
        addNumberToInput(number: "5")
    }
    
    @IBAction func button6(_ sender: Any) {
        addNumberToInput(number: "6")
    }
    
    @IBAction func button7(_ sender: Any) {
        addNumberToInput(number: "7")
    }
    
    @IBAction func button8(_ sender: Any) {
        addNumberToInput(number: "8")
    }
    
    @IBAction func button9(_ sender: Any) {
        addNumberToInput(number: "9")
    }
    
    @IBAction func buttonDoct(_ sender: Any) {
        addNumberToInput(number: ",")
    }
    
    var op = "+"
    var number1 : Double?
    
    
    @IBAction func buttonAC(_ sender: Any) {
        numberLabel.text = "0"
        newOperation = true
    }
    
    
    @IBAction func buttonMinues(_ sender: Any) {
        var textNumber = String(numberLabel.text!)
        
        textNumber = "-" + textNumber
        numberLabel.text = textNumber
    }
    
    
    @IBAction func buttonMod(_ sender: Any) {
        
        var number1 = Double(numberLabel.text!)
        
        number1 = number1! / 100.0
        
        numberLabel.text = String(number1!)
        newOperation = true
    }
    
    
    
    @IBAction func buttonMulti(_ sender: Any) {
        
        op = "*"
        number1 = Double(numberLabel.text!)
        newOperation = true
        
    }
    
    @IBAction func buttonDiv(_ sender: Any) {
        
        op = "/"
        number1 = Double(numberLabel.text!)
        newOperation = true
        
    }
    
    @IBAction func buttonSub(_ sender: Any) {
        op = "-"
        number1 = Double(numberLabel.text!)
        newOperation = true
        
    }
    
    @IBAction func buttonSum(_ sender: Any) {
        op = "+"
        number1 = Double(numberLabel.text!)
        newOperation = true
        
    }
    
    @IBAction func buttonEqual(_ sender: Any) {
        
        let number2 = Double(numberLabel.text!)
        var results : Double?
        
        switch op {
        case "*":
            results = number1! * number2!
        case "/":
            results = number1! / number2!
        case "-":
            results = number1! - number2!
        case "+":
            results = number1! + number2!
            
        default:
            results = 0.0
        }
        
        numberLabel.text = String(results!)
        newOperation = true
    }
}

