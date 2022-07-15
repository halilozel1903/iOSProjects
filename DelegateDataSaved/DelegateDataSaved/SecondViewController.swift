//
//  SecondViewController.swift
//  DelegateDataSaved
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

protocol TeamSelectedDelegate {
    func teamSelect(name : String)
}

class SecondViewController: UIViewController {
    
    var teamSelectedDelegate : TeamSelectedDelegate!
    
    
    @IBAction func teamSelectedAction(_ sender: UIButton) {
        
        teamSelectedDelegate.teamSelect(name: sender.title(for: .normal)!)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}
