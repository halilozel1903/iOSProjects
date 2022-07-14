//
//  CollectionViewController.swift
//  CollectionViewApp
//
//  Refactored by Halil Özel on 14.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

private let reuseIdentifier = "MyCell"

class CollectionViewController: UICollectionViewController {
    
    var imageArray = [UIImage]()
    
    // Layout işlemi için
    let solSagBosluk : CGFloat = 32.0
    let numberOfCell : CGFloat = 3.0
    let neKadarFazla : CGFloat = 20.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (((collectionView?.layer.bounds.width)! - solSagBosluk) / numberOfCell)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width+neKadarFazla)
        
        // asset dosyasındaki elemanları ekliyor.
        for index in 1...24{
            
            imageArray.append(UIImage(named: "afis\(index)")!)
        }
    }
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageArray.count
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.AfisImageView.image = imageArray[indexPath.row]
        
        // Configure the cell
        
        return cell
    }
}
