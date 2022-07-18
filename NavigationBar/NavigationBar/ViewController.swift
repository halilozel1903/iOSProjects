//
//  ViewController.swift
//  NavigationBar
//
//  Refactored by Halil Özel on 18.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBAction
    
    @IBAction func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Info", message: "Add butonuna tıklandı.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    @IBAction func cameraClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Info", message: "Camera butonuna tıklandı.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

