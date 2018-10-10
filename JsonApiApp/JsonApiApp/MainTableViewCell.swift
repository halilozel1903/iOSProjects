//
//  MainTableViewCell.swift
//  JsonApiApp
//
//  Created by Halil Özel on 10.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    //MARK: - IBOutlets // yapıları koda bağladık.
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencySelling: UILabel!
    @IBOutlet weak var currencyBuying: UILabel!
    @IBOutlet weak var currencyChangeRate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
