//
//  RehberTableViewCell.swift
//  TableApp
//
//  Created by Halil Özel on 23.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class RehberTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
