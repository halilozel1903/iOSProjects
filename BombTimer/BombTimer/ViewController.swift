//
//  ViewController.swift
//  BombTimer
//
//  Updated by Halil Özel on 14.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer() // timer nesnesi
    
    var time = 10 // time değeri
    
    @objc func decreaseTimer(){
        
        if time > 0{
            time -= 1
            timerTxt.text = String(time)
        }else{
            timer.invalidate()
        }
    }
    
    @IBOutlet weak var timerTxt: UILabel!
    
    // timer'ı başlatıp gerekli işlemler yapılıyor.
    @IBAction func playBtn(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    // durdurma işlemleri
    @IBAction func pauseBtn(_ sender: Any) {
        
        timer.invalidate() // timer'ı durdu.
    }
    
    
    // değer azaltma işlemleri
    @IBAction func minusTenBtn(_ sender: Any) {
        
        if time > 10{
            time -= 10
            timerTxt.text = String (time)
        }
    }
    
    // değer arttırma işlemleri
    @IBAction func plusTenBtn(_ sender: Any) {
        
        time += 10
        timerTxt.text = String(time)
    }
    
    // resetleme işlemi
    @IBAction func resetBtn(_ sender: Any) {
        time = 10
        timerTxt.text = String(time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

