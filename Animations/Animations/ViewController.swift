//
//  ViewController.swift
//  Animations
//
//  Created by Halil Özel on 30.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

// internetten gif uzantılı resimler bulduk. Bulanan resimleri parçalara böldük.
// .gif uzantılı resimler kabul edilmiyor onun için .png uzantılı dosyalar eklememiz gerekmektedir.

class ViewController: UIViewController {

    @IBOutlet weak var animationImage: UIImageView!
    
    var currentImage = 1
    var totalImage = 6
    
    var timer = Timer() // timer ayarlandı.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateFrames), userInfo: nil, repeats: true)
    }

    // animasyon 1 den sona frame doğru
    @objc func updateFrame(){
        animationImage.image = UIImage(named: "fr\(currentImage)")
        currentImage += 1
        
        if currentImage == totalImage{
            currentImage = 1 
        }
    }
    
    // animasyon son frameden ilk frame doğru
    @objc func updateFrames(){
        animationImage.image = UIImage(named: "fr\(totalImage)")
        totalImage -= 1
        
        if totalImage == currentImage{
            totalImage = 6
        }
    }
    


}

