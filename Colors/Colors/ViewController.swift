//
//  ViewController.swift
//  Colors
//
//  Updated by Halil Özel on 15.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func greenClicked(_ sender: Any) {
        view.backgroundColor = UIColor.green // arka plan rengini yeşil yaptık.
    }
    
    
    @IBAction func yellowClicked(_ sender: Any) {
        view.backgroundColor = UIColor.yellow // arka plan rengini sarı yaptık.
    }
    
    
    @IBAction func redClicked(_ sender: Any) {
        view.backgroundColor = UIColor.red // arka plan rengini kırmızı yaptık.
    }
    
    @IBAction func blueClicked(_ sender: Any) {
        view.backgroundColor = UIColor.blue // arka plan rengini mavi yaptık.
    }
    
    
    @IBAction func orangeClicked(_ sender: Any) {
        view.backgroundColor = UIColor.orange // arka plan rengini turuncu yaptık.
    }
    
    @IBAction func grayClicked(_ sender: Any) {
        view.backgroundColor = UIColor.gray // arka plan rengini gri yaptık.
    }
    
}

