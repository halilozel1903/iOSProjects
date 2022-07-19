//
//  SecondViewController.swift
//  Segues
//
//  Created by Halil Özel on 20.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name is :  \(name)"
    }
    
    @IBAction func backClicked(_ sender: Any) { // geri gelme fonksiyonu
        self.dismiss(animated: true, completion: nil) // uygulamadaki ekranı sonlandırmak için kullanılan metoddur.
        // animasyonlu olsun , sonlandırdıktan sonra başka bir işlem olmasın
    }
}
