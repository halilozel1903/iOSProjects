//
//  tableVC.swift
//  MapView
//
//  Created by Halil Özel on 5.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import CoreData

class tableVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var titleArray = [String]()
    var subtitleArray = [String]()
    var latitudeArray = [Double]()
    var longitudeArray = [Double]()
    
    
    var selectedTitle = ""
    var selectedSubTitle = ""
    var selectedLatitude : Double = 0
    var selectedLongitude : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(tableVC.fetchData), name: NSNotification.Name(rawValue : "newPlace"), object: nil)
    }
    
    @objc func fetchData(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        request.returnsObjectsAsFaults = false
        
        do {
           let results = try context.fetch(request)
            
            if results.count > 0 {
                self.titleArray.removeAll(keepingCapacity: false)
                self.subtitleArray.removeAll(keepingCapacity: false)
                self.latitudeArray.removeAll(keepingCapacity: false)
                self.longitudeArray.removeAll(keepingCapacity: false)
                
                for result in results as! [NSManagedObject]{ // sonucların içinde gez
                    
                    // başlık ekleme işlemi
                    if let title = result.value(forKey: "title") as? String{
                        self.titleArray.append(title)
                    }
                    
                    // alt başlık ekleme işlemi
                    if let subtitle = result.value(forKey: "subtitle") as? String{
                        self.subtitleArray.append(subtitle)
                    }
                    
                    // enlem ekleme işlemi
                    if let latitude = result.value(forKey: "latitude") as? Double{
                        self.latitudeArray.append(latitude)
                    }
                    
                    // boylam ekleme işlemi
                    if let longitude = result.value(forKey: "longitude") as? Double{
                        self.longitudeArray.append(longitude)
                    }
                    
                    self.tableView.reloadData() // verileri yükle
                }
                
            }
        } catch  {
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTitle = titleArray[indexPath.row]
        selectedSubTitle = subtitleArray[indexPath.row]
        selectedLatitude = latitudeArray[indexPath.row]
        selectedLongitude = longitudeArray[indexPath.row]
        
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMapVC"{ // segue değerine eşitse
            
            // eşitleme işlemleri yapılıyor.
            let destinationVC = segue.destination as! mapVC
            destinationVC.selectedTitle = self.selectedTitle
            destinationVC.selectedSubtitle = self.selectedSubTitle
            destinationVC.selectedLatitude = self.selectedLatitude
            destinationVC.selectedLongitude = self.selectedLongitude
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        selectedTitle = ""
        performSegue(withIdentifier: "toMapVC", sender: nil)
    }
    
}
