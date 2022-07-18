//
//  ViewController.swift
//  SwipeAndShakeApp
//
//  Updated by Halil Özel on 19.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sağdan sola kaydırma işlemi
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipped(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        // soldan sağa kaydırma işlemi
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipped(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        
        // yukarıdan  aşağı kaydırma işlemi
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipped(gesture:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        
        // aşağıdan  yukarıya kaydırma işlemi
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipped(gesture:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    // uygulamayı titretme işlemi
    override func motionEnded(_ motion:UIEventSubtype, with event: UIEvent?){
        
        if event?.subtype == UIEventSubtype.motionShake{
            print("cihaz sallandı")
        }
    }
    
    
    // kaydırma hareketlerinin ayrıştırılması
    @objc func swipped(gesture:UIGestureRecognizer){
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.left{
                print("soldan sağa ")
            }else if swipeGesture.direction == UISwipeGestureRecognizerDirection.right{
                print("sağdan sola")
            }else if swipeGesture.direction == UISwipeGestureRecognizerDirection.up{
                print("yukarıdan aşağı")
            }else if swipeGesture.direction == UISwipeGestureRecognizerDirection.down{
                print("aşağıdan yukarı")
            }
        }
    }
}

