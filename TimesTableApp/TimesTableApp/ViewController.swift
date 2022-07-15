//
//  ViewController.swift
//  TimesTableApp
//
//  Updated by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // slider değişkeni
    @IBOutlet weak var slider: UISlider!
    
    // tableView değişkeni
    @IBOutlet weak var table: UITableView!
    
    // slider metodu
    @IBAction func sliderChanged(_ sender: Any) {
        table.reloadData() // değerleri güncelle
        // print(slider.value)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50 // satır sayısı
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // cell tanımı
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        // işlemler
        cell.textLabel?.text = String((Int(slider.value * 20)) * (indexPath.row + 1))
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

