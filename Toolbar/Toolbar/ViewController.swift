//
//  ViewController.swift
//  Toolbar
//
//  Updated by Halil Özel on 15.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBAction
    
    @IBAction func loadButton(_ sender: Any) {
        print("load butonuna basıldı.")
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        print("stop butonuna basıldı.")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

