//
//  ViewController.swift
//  AutoLayoutProgrammatic
//
//  Created by Halil Özel on 20.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // square adında bir çerçeve oluşturduk.
       // let square = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        let square = UIView(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 100 , width: 200, height: 200)) // square ekranda ortalandı.

        
        // ekranda net anlaşılsın diye arka plan rengi atandı.
        square.backgroundColor = UIColor.red
        
        // bu yapıyı subView diyerek ekledik.
        self.view.addSubview(square)

    }


}

