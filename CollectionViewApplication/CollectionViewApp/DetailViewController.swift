//
//  DetailViewController.swift
//  CollectionViewApp
//
//  Created by macbookpro on 17.06.2019.
//  Copyright © 2019 halilozel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var sentData : String!
    
    var detailData : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        detailImageView.image = UIImage(named: sentData)
        
        detailLabel.text = detailData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
