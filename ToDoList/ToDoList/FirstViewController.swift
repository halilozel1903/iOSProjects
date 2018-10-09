//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Halil Özel on 9.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet weak var table: UITableView!
    
    var items:[String] = [] // değiştirilebilir array türü
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count // table row sayısı item değerlerinin sayısı kadar.
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
       
        
        cell.textLabel?.text = items[indexPath.row] // değeri text'e atadık.
        
        return cell // geriye cell değerini döndürdü.
    }
    
    
    // row silme işlemleri
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            items.remove(at: indexPath.row) // seçilen row değerini sil.
            
            table.reloadData() // tabloyu güncelle
            
            UserDefaults.standard.set(items, forKey: "items") // verileri check et
        }
        
    }
    
    
    // veriyi güncelleyip tabloda gösterme işlemi
    override func viewDidAppear(_ animated: Bool) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items") // item değeri alındı.
        
        if let tempItems = itemObject as? [String]{ //değiştirilebilir array türünde ise
            
            items = tempItems // değeri items array'ine ata
        }
        
        table.reloadData() // tabloyu güncelle
        
    }


}

