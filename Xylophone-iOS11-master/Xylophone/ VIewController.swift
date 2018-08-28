//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // ses ile ilgili özelliklerin kullanımı için eklendi.

class ViewController: UIViewController,AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer! // player değişkeni olusturdu.
    
    let soundArray = ["note1","note2","note3","note4","note5","note6","note7"] // sound array
    
    var selectedSoundFileName : String = "" // hangi sesi seçecek onu öğrenmek için

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
     
        selectedSoundFileName = soundArray[sender.tag - 1] // tıklanan butona göre sesi çal
        playSound() // metodu çağırdık.
     
    }
    
    func playSound()  {
        // url değerini ver
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!) // url değerini ata
            
        }catch{
            print(error) // hata varsa ekrana yaz
        }
        audioPlayer.play() // sesi çal
    }
    
  

}

