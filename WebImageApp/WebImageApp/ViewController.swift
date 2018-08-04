//
//  ViewController.swift
//  WebImageApp
//
//  Created by Halil Özel on 4.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var webImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let url = URL(string: "https://i.pinimg.com/474x/a4/86/4d/a4864dcae5ab30a382e30e30f23a9440.jpg"){
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error == nil{
                    
                    if let incomingData = data{
                        
                        let image = UIImage(data: incomingData)
                        
                        DispatchQueue.main.sync(execute: {
                            self.webImage.image = image
                        })
                    }
                }
                
            
            }
            task.resume()
        }
        
    }

   


}

