//
//  MainTableViewController.swift
//  JsonApiApp
//
//  Refactored by Halil Özel on 17.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import Alamofire // ekledik.
import SwiftyJSON // ekledik.

class MainTableViewController: UITableViewController {
    
    var currencies = [Currency]() // array olustur.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLatesData() // metodu çağır.
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // size'ı ne kadar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currencies.count
    }
    
    
    // Cellde neler gösterilecek onların ayarlanması yapıldı.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainTableViewCell
        
        cell.currencyCode.text = currencies[indexPath.row].code
        cell.currencyName.text = currencies[indexPath.row].full_name
        cell.currencySelling.text = String(currencies[indexPath.row].selling)
        cell.currencyBuying.text = String(currencies[indexPath.row].buying)
        cell.currencyChangeRate.text = String(currencies[indexPath.row].change_rate)
        
        return cell
    }
    
    
    //MARK: - Functions // JSON ile veriyi aldık. İşledik. Gösterdik.
    func getLatesData(){
        
        Alamofire.request("https://www.doviz.com/api/v1/currencies/all/latest", method: .get).validate().responseJSON { response in
            switch response.result { // sonuc basarılı ise
            case .success(let value):
                
                let json = JSON(value) // json nesnesi
                
                for index in 0...json.count{
                    // değerleri okuma işlemi - anlama alanı
                    let newCurrency = Currency(selling:json[index]["selling"].doubleValue,
                                               update_date: json[index]["update_date"].intValue ,
                                               currency: json[index]["currency"].intValue ,
                                               buying: json[index]["buying"].doubleValue ,
                                               change_rate: json[index]["change_rate"].doubleValue ,
                                               name: json[index]["name"].stringValue ,
                                               full_name: json[index]["full_name"].stringValue ,
                                               code: json[index]["code"].stringValue)
                    
                    self.currencies.append(newCurrency) // ekleme işlemi
                    
                }
                
                self.tableView.reloadData() // tabloyu güncelleme işlemi
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
