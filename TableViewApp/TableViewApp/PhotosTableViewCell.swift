//
//  PhotosTableViewCell.swift
//  TableViewApp
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var grandientView: UIView!
    @IBOutlet weak var theImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var photographerImageView: UIImageView!
    
    var photo: Photo!{
        
        didSet{
            self.updateUI()
        }
    }
    
    private func updateUI(){
        
        self.theImageView.image = UIImage(named : photo.name)
        self.photographerImageView.image = UIImage(named: photo.thumbnailImageName)
        self.captionLabel.text = photo.caption
        
    }
}
