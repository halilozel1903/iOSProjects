//
//  DetailViewController.swift
//  CollectionViewApp
//
//  Updated by halilozel on 14.07.2022.
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
