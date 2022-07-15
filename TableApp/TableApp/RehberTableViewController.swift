//
//  RehberTableViewController.swift
//  TableApp
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class RehberTableViewController: UITableViewController {
    
    
    let rehberItems = [
        RehberItem(name:"Halil", status:true, profileImg:#imageLiteral(resourceName: "man1")),
        RehberItem(name:"İbrahim", status:false, profileImg:#imageLiteral(resourceName: "man2")),
        RehberItem(name:"Yusuf", status:false, profileImg:#imageLiteral(resourceName: "man3")),
        RehberItem(name:"Emre", status:true, profileImg:#imageLiteral(resourceName: "man4")),
        RehberItem(name:"Hüseyin", status:true, profileImg:#imageLiteral(resourceName: "man5")),
        RehberItem(name:"Enes", status:false, profileImg:#imageLiteral(resourceName: "man6")),
        RehberItem(name:"Sinan", status:false, profileImg:#imageLiteral(resourceName: "man7")),
        RehberItem(name:"Yakup", status:true, profileImg:#imageLiteral(resourceName: "man8")),
        RehberItem(name:"Adem", status:true, profileImg:#imageLiteral(resourceName: "man9")),
        RehberItem(name:"Mustafa", status:false, profileImg:#imageLiteral(resourceName: "man10")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rehberItems.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RehberCell", for: indexPath) as! RehberTableViewCell
        
        let rowNumber = indexPath.row
        let currentItem = rehberItems[rowNumber]
        cell.nameText.text = currentItem.name
        
        cell.imageView?.image = currentItem.profileImg
        
        if currentItem.status == true {
            cell.statusLabel.textColor = UIColor.green
            cell.statusLabel.text = "Online"
        }else{
            cell.statusLabel.textColor = UIColor.red
            cell.statusLabel.text = "Offline"
        }
        
        return cell
    }
}
