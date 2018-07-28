//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Halil Özel on 28.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var teamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeName(_:)), name: NSNotification.Name(rawValue: "teamSelectNotification"), object: nil)
        
    }

    

    @IBAction func teamSelected(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "StoryboardViewControllerID") as! SecondViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func changeName(_ notification : NSNotification){
        
        if let name = notification.userInfo?["name"] as? String{
            
            self.teamLabel.text = name
            
        }
        
        
    }
    
}

