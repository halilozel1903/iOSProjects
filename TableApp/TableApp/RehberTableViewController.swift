//
//  RehberTableViewController.swift
//  TableApp
//
//  Created by Halil Özel on 23.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class RehberTableViewController: UITableViewController {

    let nameArray = ["Halil",
                     "İbrahim",
                     "Yusuf",
                     "Emre",
                     "Hüseyin",
                     "Enes",
                     "Sinan",
                     "Yakup",
                     "Adem",
                     "Mustafa"]
    
    let statusArray = [true,
                     false,
                     false,
                     true,
                     true,
                     false,
                     false,
                     true,
                     true,
                     false]
    
    let imageArray = [#imageLiteral(resourceName: "man1"),
                       #imageLiteral(resourceName: "man2"),
                       #imageLiteral(resourceName: "man3"),
                       #imageLiteral(resourceName: "man4"),
                       #imageLiteral(resourceName: "man5"),
                       #imageLiteral(resourceName: "man6"),
                       #imageLiteral(resourceName: "man7"),
                       #imageLiteral(resourceName: "man8"),
                       #imageLiteral(resourceName: "man9"),
                       #imageLiteral(resourceName: "man10")]
    
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
        return nameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RehberCell", for: indexPath) as! RehberTableViewCell

        let rowNumber = indexPath.row
        cell.nameText.text = nameArray[rowNumber]
        
        cell.imageView?.image = imageArray[rowNumber]
        
        if statusArray[rowNumber] == true {
            cell.statusLabel.textColor = UIColor.green
            cell.statusLabel.text = "Online"
        }else{
             cell.statusLabel.textColor = UIColor.red
             cell.statusLabel.text = "Offline"
        }

        return cell
    }
    

   

}
