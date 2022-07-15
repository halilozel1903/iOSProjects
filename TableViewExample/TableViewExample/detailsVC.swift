//
//  detailsVC.swift
//  TableViewExample
//
//  Updated by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class detailsVC: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var selectedTeams = Teams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedTeams.name
        dateLabel.text = selectedTeams.date
        imageView.image = selectedTeams.image
        
    }
}
