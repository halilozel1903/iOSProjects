//
//  ViewController.swift
//  NavigationMenuApp
//
//  Created by Halil Özel on 27.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var messageTxt: UILabel!
    
    @IBAction func cameraItem(_ sender: Any) {
        messageTxt.text = "Camera butonuna tıklandı !!!"
    }
    
    
    @IBAction func searchItem(_ sender: Any) {
        messageTxt.text = "Search butonuna tıklandı !!!"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

}
