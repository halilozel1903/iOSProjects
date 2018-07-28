//
//  SecondViewController.swift
//  NotificationCenter
//
//  Created by Halil Özel on 28.07.2018.
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
