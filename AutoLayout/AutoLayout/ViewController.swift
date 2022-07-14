//
//  ViewController.swift
//  AutoLayout
//
//  Updated by Halil Özel on 14.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let bearImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bear_first")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let descriptionTextView : UITextView = {
        
        let textView = UITextView()
        textView.text = "Join us today is cur fun and games !"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        return textView
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // let imageView = UIImage(named: "bear_first")!
        // bgImageView = UIImageView(image: imageView)
        // bgImageView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // self.view.addSubview(bearImageView)
        
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    
    private func setupLayout(){
        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bearImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor,constant:120).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:0).isActive = true
        
        /*
         
         // this enables autolayout for our imageview
         
         bearImageView.translatesAutoresizingMaskIntoConstraints = false
         
         // düzeni otamatik yapmamasını gerektiğini bildirdik.
         
         
         bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         // bgImageView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         
         bearImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
         
         bearImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
         bearImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true*/
    }
}

