//
//  SecondViewController.swift
//  NotificationCenter
//
//  Refactored by Halil Özel on 18.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func teamSelectAction(_ sender: UIButton) {
        
        let dict : [String : String] = ["name": sender.title(for: .normal)!]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "teamSelectNotification"), object: nil, userInfo: dict)
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
