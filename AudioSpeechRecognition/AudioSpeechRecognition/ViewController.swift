//
//  ViewController.swift
//  AudioSpeechRecognition
//
//  Updated by Halil Özel on 14.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ses dosyası için bir path tanımlandı.
        if let audioPath = Bundle.main.path(forResource: "sound1", ofType: "mp3"){
            
            // url değerine path atandı.
            let url = URL(fileURLWithPath: audioPath)
            
            // sesi tanımak için recognizer oluşturuldu.
            let recognizer = SFSpeechRecognizer()
            
            // istek tanımlandı.
            let request = SFSpeechURLRecognitionRequest(url:url)
            
            // aşağıdaki işlemler başarılı olursa sesi anlayıp console değerlerini yazdıracak
            recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                
                if error == nil{
                    
                    if result != nil{
                        
                        print(result?.bestTranscription.formattedString as Any)
                    }
                }
            })
        }
    }
}

