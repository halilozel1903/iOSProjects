//
//  ViewController.swift
//  MapApp
//
//  Created by Halil Özel on 31.07.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // harita işlemleri
        let latitude : CLLocationDegrees = 41.0391168
        let longitude : CLLocationDegrees = 28.9940661
        
        let lanDelta : CLLocationDegrees = 0.05
        let lonDelta : CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpanMake(lanDelta, lonDelta)
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region = MKCoordinateRegionMake(coordinates, span)
        
        mapView.setRegion(region, animated: true)
        
        
        // Pin gösterme işlemi
        let annotation = MKPointAnnotation()
        annotation.title = "Vodafone Park"
        annotation.subtitle = "Stadium"
        annotation.coordinate = coordinates
        mapView.addAnnotation(annotation)
        
        
        // long press tanıma
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(addNewPin(gestureRecognizer :)))
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
        
        
    
        
    }
    
    // kullanıcı map'e dokununca pin ekleme yeri
    @objc func  addNewPin(gestureRecognizer:UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        let coordinate = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        
        mapView.addAnnotation(annotation)
    }

    

}

