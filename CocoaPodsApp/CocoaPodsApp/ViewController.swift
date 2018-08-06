//
//  ViewController.swift
//  CocoaPodsApp
//
//  Created by Halil Özel on 6.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController {

    var timer = Timer()
    
    @IBAction func showLoading(_ sender: Any) {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.label.text = "Loading ..."
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(hideLoading), userInfo: nil, repeats: false)
    }
    
    
    

    @objc func hideLoading(){
        
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

