//
//  ViewController.swift
//  CoreDataExample
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // verileri diziler yoluyla çekeceğiz
    var nameArray = [String]()
    var citynameArray = [String]()
    var dateArray = [Int]()
    var imageArray = [UIImage]()
    var selectedTeams = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getInfo()
    }
    
    
    // her sayfa açıldığında çalışan bir metoddur.
    override func viewWillAppear(_ animated: Bool) {
        
        // diğer sayfadan alınan veri ile uyumluysa yenileme işlemi gerçekleşiyor.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.getInfo), name: NSNotification.Name(rawValue : "newTeams"), object: nil)
    }
    
    @objc func getInfo(){
        
        // içerisindeki tüm verileri sil.
        nameArray.removeAll(keepingCapacity: false)
        citynameArray.removeAll(keepingCapacity: false)
        dateArray.removeAll(keepingCapacity: false)
        imageArray.removeAll(keepingCapacity: false)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")  //verileri getir.
        fetchRequest.returnsObjectsAsFaults = false // verileri dizilere eklemek için false yaptık.
        
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 { // eğer array içerisinde bir şey varsa
                
                for result in results as! [NSManagedObject]{ // sonuc değeri NSManagedObject türünde olacak
                    
                    if let name = result.value(forKey: "name") as? String{
                        self.nameArray.append(name)
                    }
                    
                    if let cityName = result.value(forKey: "cityname") as? String{
                        self.citynameArray.append(cityName)
                    }
                    
                    if let date = result.value(forKey: "date") as? Int{
                        self.dateArray.append(date)
                    }
                    
                    if let imageData = result.value(forKey: "image") as? Data{
                        
                        let image = UIImage(data: imageData)
                        self.imageArray.append(image!)
                    }
                    
                    self.tableView.reloadData() // tableview guncelle
                }
            }
            
        } catch  {
            print("ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.chosenTeams = selectedTeams // kullanıcının secimini aldık diğer tarafa aktardık.
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTeams = nameArray[indexPath.row] // secilen degerlerle gelecek degerin index değerini esitledik.
        performSegue(withIdentifier: "detailsVC", sender: nil) // segue olusturduk.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count // listede bulunacak satır sayısı
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = nameArray[indexPath.row] // satırlarda bulunacak degerler
        return cell
    }
    
    @IBAction func addClicked(_ sender: Any) {
        selectedTeams = "" // yeni birşey secilmediginde bos olarak gösterebiliriz.
        performSegue(withIdentifier: "detailsVC", sender: nil) // segue olusturduk.
        
    }
}

