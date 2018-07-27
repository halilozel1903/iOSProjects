//
//  ViewController.swift
//  SwitchScreens
//
//  Created by Halil Özel on 27.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func ikinciEkranaGit(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondStoryboardID")
        self.show(vc!, sender: nil)
        
    }
    
    
    
    @IBAction func ucuncuEkranaGit(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdStoryboardID")
        
        self.present(vc!, animated: true, completion: nil)
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

