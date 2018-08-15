//
//  PhotosTableViewController.swift
//  TableViewApp
//
//  Created by Halil Özel on 13.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

   
    // data
    var photos = Photo.downloadAllPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 250.0
       
    }

  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhotosTableViewCell
        
        let photo = photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
  

}
