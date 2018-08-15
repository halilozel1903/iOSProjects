//
//  Photo.swift
//  TableViewApp
//
//  Created by Halil Özel on 15.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Foundation

class Photo {

    var name : String = ""
    var profileImage : String = ""
    var caption : String = ""
    var thumbnailImageName : String = ""
    
    
    init(name:String,profileImage:String,caption:String,thumbnailImageName:String) {
        
        self.name = name
        self.profileImage = profileImage
        self.caption = caption
        self.thumbnailImageName = thumbnailImageName

    }
    
    class func downloadAllPhotos() -> [Photo]{
        
        var photos = [Photo]()
        
        for i in 1...6 {
            
            let photo = Photo(name: "\(i)", profileImage: "p\(i)", caption: "hello guys", thumbnailImageName: "t\(i)")
            photos.append(photo)
            
        }
        
        return photos
    }
    
    
    
    
}
