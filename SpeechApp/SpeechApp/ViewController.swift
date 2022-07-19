//
//  ViewController.swift
//  SpeechApp
//
//  Created by Halil Özel on 20.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController,SFSpeechRecognizerDelegate {
    
    @IBOutlet weak var textDetail: UITextView!
    @IBOutlet weak var playButton: UIButton!
    
    // sesimizi anlayıp ekranda o kelimeleri gösterecek bir uygulamanın hazırlanması
    let speechRecognizer = SFSpeechRecognizer()
    let audioEngine = AVAudioEngine()
    var recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask = SFSpeechRecognitionTask()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRecognizer?.delegate = self
        playButton.isEnabled = false
        
        // buttonların durumlarına göre neler ekranda gösterilecek onlar tanımlandı.
        SFSpeechRecognizer.requestAuthorization { (izin) in
            
            OperationQueue.main.addOperation {
                
                switch izin{
                    
                case .authorized:
                    self.playButton.setTitle("Kayda Başla", for: .normal)
                    self.playButton.isEnabled = true
                    
                case .denied:
                    self.playButton.setTitle("Lütfen izninizi kontrol ediniz", for: .normal)
                    self.playButton.isEnabled = false
                    
                case .notDetermined:
                    self.playButton.setTitle("Lütfen izin veriniz.", for: .normal)
                    self.playButton.isEnabled = false
                    
                default:
                    break
                    
                }
            }
        }
    }
    
    
    // butona tıklanınca yapılacak işlemler
    @IBAction func playClicked(_ sender: Any) {
        
        // çalışırken yapılan işlemler neler olacak
        if audioEngine.isRunning{
            
            audioEngine.stop() // durdur.
            recognitionRequest.endAudio() // sonlandır.
            recognitionTask.cancel() // iptal et.
            audioEngine.inputNode.removeTap(onBus: 0) // değeri sıfırlandı.
            
            self.playButton.setTitle("Kayda Başla", for: .normal) // button yazısı
            
            
            // çalışmadan önce gerekli ayarlar yapılıyor.
        }else{
            self.playButton.setTitle("Kayıt durdu.", for: .normal)
            
            do{
                // kayot işlemleri için hazırlıklar yapılıyor.
                let audioSession = AVAudioSession.sharedInstance()
                try audioSession.setCategory(AVAudioSessionCategoryRecord)
                try audioSession.setMode(AVAudioSessionModeMeasurement)
                try audioSession.setActive(true,with: .notifyOthersOnDeactivation)
                
                let inputMode = audioEngine.inputNode // mode olusturma
                
                recognitionRequest.shouldReportPartialResults = true
                
                // task ile ilgili olaylar
                recognitionTask = (speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
                    
                    if error == nil{ // hata yoksa
                        
                        if result != nil{ // sonuc bos degilse
                            
                            // ekranda söylenen kelimeleri yazdır.
                            self.textDetail.text = result?.bestTranscription.formattedString
                            
                            if (result?.isFinal)!{ // bitmiş ise
                                self.audioEngine.stop() // durdur.
                                inputMode.removeTap(onBus: 0) // sıfırla
                            }
                        }
                    }
                    
                }))!
                
                let recordingFormat = inputMode.outputFormat(forBus: 0) // kaytıt formatı
                
                inputMode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat, block: { (buffer, time) in
                    self.recognitionRequest.append(buffer) // buffer ekleme
                })
                
                audioEngine.prepare() // hazırlama
                
                try audioEngine.start() // kayıda basla
                
            }catch{
                print("error") // hata mesajı
            }
        }
    }
}

