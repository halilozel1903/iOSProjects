//
//  ViewController.swift
//  TableViewExample
//
//  Created by Halil Özel on 30.06.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var teamsAraay = [Teams]() // Teams sınıfından bir aray oluşturma
    
    var chosenTeam = Teams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let bjk = Teams()
        bjk.name = "Beşiktaş"
        bjk.date = "1903"
        bjk.image = UIImage(named: "bjk.jpg")!
        
        let fb = Teams()
        fb.name = "Fenerbahçe"
        fb.date = "1907"
        fb.image = UIImage(named: "fb.jpg")!
        
        let gs = Teams()
        gs.name = "Galatasaray"
        gs.date = "1905"
        gs.image = UIImage(named: "gs.jpg")!
        
        let ts = Teams()
        ts.name = "Trabzonspor"
        ts.date = "1967"
        ts.image = UIImage(named: "ts.png")!
        
         teamsAraay.append(bjk)
         teamsAraay.append(fb)
         teamsAraay.append(gs)
         teamsAraay.append(ts)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamsAraay.count // array boyutu kadar oluştur.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = teamsAraay[indexPath.row].name // array içindeki name değeri
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenTeam = teamsAraay[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedTeams = self.chosenTeam
        }
    }




}

