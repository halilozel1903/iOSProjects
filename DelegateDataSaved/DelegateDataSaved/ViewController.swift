//
//  ViewController.swift
//  DelegateDataSaved
//
//  Created by Halil Özel on 28.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TeamSelectedDelegate {
    
    
    @IBOutlet weak var teamLabel: UILabel!
    
    
    func teamSelect(name: String) {
        teamLabel.text = name
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func teamSelected(_ sender: Any) {
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "TakimSecStoryboardID") as! SecondViewController
        
        vc.teamSelectedDelegate = self
        
        self.present(vc, animated: true, completion: nil)
        
    }
    

}

