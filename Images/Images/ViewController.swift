//
//  ViewController.swift
//  Images
//
//  Created by Halil Özel on 28.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var number = 0 // number adında bir degisken tanımlandı.

    @IBOutlet weak var image: UIImageView! // image tanımlandı.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

   
    @IBAction func changeClicked(_ sender: Any) {
        
        if number == 0 {
            
            image.image = UIImage(named: "tr.png")
            number = number + 1
        }else if number == 1{
            image.image = UIImage(named: "az.gif")
            number = number - 1
        }
        
    }
    

}

