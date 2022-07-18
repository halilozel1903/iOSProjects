//
//  ViewController.swift
//  SwipeGestureRecognizer
//
//  Updated by Halil Özel on 19.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.isUserInteractionEnabled = true
        
        let swiftRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftRight.direction = UISwipeGestureRecognizerDirection.right
        myImage.addGestureRecognizer(swiftRight)
        
        let swiftLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftLeft.direction = UISwipeGestureRecognizerDirection.left
        myImage.addGestureRecognizer(swiftLeft)
        
        let swiftUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftUp.direction = UISwipeGestureRecognizerDirection.up
        myImage.addGestureRecognizer(swiftUp)
        
        let swiftDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swiftDown.direction = UISwipeGestureRecognizerDirection.down
        myImage.addGestureRecognizer(swiftDown)
        
        
    }
    
    @objc func swipeGesture(sender : UISwipeGestureRecognizer)  {
        
        if let swipeGesture = sender as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizerDirection.right :
                print("Swipe Right")
                myImage.image = UIImage(named: "2")
                
            case UISwipeGestureRecognizerDirection.left :
                print("Swipe Left")
                myImage.image = UIImage(named: "3")
                
                
            case UISwipeGestureRecognizerDirection.up :
                print("Swipe Up")
                myImage.image = UIImage(named: "4")
                
                
            case UISwipeGestureRecognizerDirection.down :
                print("Swipe Down")
                myImage.image = UIImage(named: "5")
            default :
                break
            }
        }
        
    }
}

