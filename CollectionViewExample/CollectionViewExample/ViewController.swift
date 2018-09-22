//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Halil Özel on 29.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    var pictures = [#imageLiteral(resourceName: "prayer"),#imageLiteral(resourceName: "earth"),#imageLiteral(resourceName: "phone-receiver"),#imageLiteral(resourceName: "university"),#imageLiteral(resourceName: "coins")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        
        cell.layer.cornerRadius = 25
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.borderWidth = 5
        
        cell.image.image = pictures[indexPath.row]
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tıklandı !!!")
    }



}

