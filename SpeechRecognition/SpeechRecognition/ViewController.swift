//
//  ViewController.swift
//  SpeechRecognition
//
//  Created by Halil Özel on 10.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import AVKit
import Speech

class ViewController: UIViewController {
    @IBOutlet weak var txtMusic: UITextView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func playClicked(_ sender: Any) {
        self.requestSpeechAuth()
    }
    
    func requestSpeechAuth(){
        
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                
                if let path = Bundle.main.url(forResource: "music", withExtension: "mp3"){
                    
                    do{
                        let audio = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = audio
                        self.audioPlayer.play()
                        
                    }catch{
                        
                        print("Error !!!")
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    
                    recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                        if let err = error{
                            print("error : \(err)")
                        }else{
                            self.txtMusic.text = result?.bestTranscription.formattedString
                        }
                    })
                }
            }
        }
    }
}

