//
//  detailsVC.swift
//  TableViewExample
//
//  Created by Halil Özel on 30.06.2018.
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
