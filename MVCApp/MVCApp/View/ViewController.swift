//
//  ViewController.swift
//  MVCApp
//
//  Created by Halil Özel on 6.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var buying: UILabel!
    @IBOutlet weak var selling: UILabel!
    @IBOutlet weak var updateDate: UILabel!
    
    var money = Money()
    
    
    override func viewWillAppear(_ animated: Bool) {
        printScreen()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func printScreen(){
        
        self.fullName.text = money.full_name
        self.code.text = money.code
        self.buying.text = money.buyingString
        self.selling.text = money.sellingString
        self.updateDate.text = money.dateString
    }


}

