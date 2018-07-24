//
//  SearchTableViewController.swift
//  TableViewSearch
//
//  Created by Halil Özel on 24.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController,UISearchControllerDelegate,UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchController.definesPresentationContext = true
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        
        if #available(iOS 9.1, *){
            
            self.searchController.obscuresBackgroundDuringPresentation = false
        }
        
        searchController.searchBar.placeholder = "Ne aramıştınız"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        
        self.navigationItem.titleView = searchController.searchBar

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        searchController.isActive = false
    }
    


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell

        // Configure the cell...

        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("search butonuna basıldı")
    }

}




extension SearchTableViewController : UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text{
            
            if searchText != ""{
                print("aranan \(searchText)")
            }
        }
    }
    
    
}











