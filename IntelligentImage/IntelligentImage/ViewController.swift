//
//  ViewController.swift
//  IntelligentImage
//
//  Refactored by Halil Özel on 17.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    var chosenImage = CIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func choosenImageClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!){
            
            self.chosenImage = ciImage
        }
        recognizeImage(image: chosenImage)
    }
    
    
    func recognizeImage(image : CIImage){
        
        textLabel.text = "Finding ..." // kullanıcı resim analiz edilirken bu mesajı görecek
        
        // elimizdeki modeli eşitleme işlemi yapılıyor.
        
        if let model = try? VNCoreMLModel(for: GoogLeNetPlaces().model){
            
            // bu modelimiz için bir handler oluşturuyoruz
            
            let request = VNCoreMLRequest(model: model ,completionHandler : { (vnrequest, error) in
                
                if let results = vnrequest.results as? [VNClassificationObservation]{
                    
                    let topResult = results.first
                    
                    // yeni bir thread oluşturma bu işlemlerde uygulama kitlenmesin diye arka planda yapılır.
                    DispatchQueue.main.async {
                        
                        let conf = (topResult?.confidence)! * 100 // yüzdelik dilim ile resmi tespit yapma
                        
                        self.textLabel.text = "\(conf)% it's \(topResult!.identifier)" // sonucu ekranda yazdır.
                    }
                }
            })
            
            // handler kullanımı
            
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                
                do{
                    try handler.perform([request]) // sonucu gönder
                    
                }catch{
                    print("error") // hata bastır.
                }
            }
        }
    }
}

