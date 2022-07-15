//
//  detailsVC.swift
//  CoreDataExample
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

import CoreData // CoreData'ya ait yapıları kullanmamızı sağlıyor.

class detailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var cityNameText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    var chosenTeams = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenTeams != ""{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")
            
            // name değeri chosenTeams değerine eşitse getir. Filtre uygulandı.
            fetchRequest.predicate = NSPredicate(format: "name = %@", self.chosenTeams)
            
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                
                let results = try context.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject]{
                        
                        if let name = result.value(forKey: "name") as? String{
                            
                            nameText.text = name
                        }
                        
                        if let cityName = result.value(forKey: "cityname") as? String{
                            
                            cityNameText.text = cityName
                        }
                        
                        if let date = result.value(forKey: "date") as? Int{
                            
                            dateText.text = String(date)
                        }
                        
                        if let dataImage = result.value(forKey: "image") as? Data{
                            
                            let image = UIImage(data: dataImage)
                            self.imageView.image = image
                        }
                        
                    }
                }
                
                
            }catch{
                
                print("Error")
                
            }
        }
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(detailsVC.selectedImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func selectedImage(){ // resim secme islemi yapılıyor.
        
        let picker = UIImagePickerController() // picker nesnesi olusturuldu.
        picker.delegate = self
        picker.sourceType = .photoLibrary // daha önceden cekilmis fotoları kutuphaneden alır.
        picker.allowsEditing = true // resimlere edit işlemi yapsın mı ?
        present(picker, animated: true, completion: nil) // Bir denetleyici modu sunar.
        
    }
    
    // image secildikten sonraki işlemler
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage //sectiğin yapı resim
        self.dismiss(animated: true, completion: nil) // sectikten sonra kapat
    }
    
    
    @IBAction func saveClicked(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //app delegate değişkeni olarak tanımladık.
        let context = appDelegate.persistentContainer.viewContext // context değeri tanımlanıyor.
        
        // core data işleminde kullanılacak yapı eşleniyor.
        let newTeams = NSEntityDescription.insertNewObject(forEntityName: "Teams", into: context)
        
        // attributes
        
        // string ifadeleri kayıt etme
        newTeams.setValue(nameText.text, forKey: "name")
        newTeams.setValue(cityNameText.text, forKey: "cityname")
        
        
        // integer ifadeyi kayıt etme
        if let year = Int(dateText.text!){
            
            newTeams.setValue(year, forKey: "date")
            
        }
        
        
        // image ifadeyi kayıt etme
        let data = UIImageJPEGRepresentation(imageView.image!, 0.5) // ikinci parametre sıkıstırma miktarı
        newTeams.setValue(data, forKey: "image")
        
        do{ // bir hata olursa
            try context.save() // context değerini kayıt et
            print("succesful")
        }catch{ // hatayı bastır
            print("error")
        }
        
        // burada verilen değeri karşı tarafta eşleyip sayfası yenileme işlemi yapacağız.
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue : "newTeams"), object: nil)
        
        self.navigationController?.popViewController(animated: true) // bulunduğun yerden bir öncekine git.
        
    }
}
