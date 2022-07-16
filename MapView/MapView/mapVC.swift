//
//  ViewController.swift
//  MapView
//
//  Updated by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit
import MapKit // map ile ilgili işlemler için eklendi.
import CoreLocation // Lokasyonla ilgili işlemler yapılacak
import CoreData // veritabanı işlemleri

class mapVC: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    
    // info.plist'e gerekli izni ve açıklamasını eklemeyi unutmayınız !!!
    
    
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedTitle = ""
    var selectedSubtitle = ""
    var selectedLatitude : Double = 0
    var selectedLongitude : Double = 0
    
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    // Konumunuza bağlı etkinliklerin uygulamanıza teslim edilmesini başlatmak ve durdurmak için kullandığınız nesne.
    var locationManager = CLLocationManager()
    
    var requestCLLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Bir harita görünümü, harita verilerinin yüklenmesine ve görüntülenen haritanın bölümünün değiştirilmesine ilişkin olarak temsilcisine mesaj gönderir. Temsilci ayrıca haritadaki ilgi noktalarını vurgulamak için kullanılan ek açıklama görünümlerini de yönetir. */
        
        mapView.delegate = self // haritayı eklemek için gerekli yapı
        locationManager.delegate = self // Güncelleştirme olaylarını almak için temsilci nesnesi.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // en iyi şekilde lokasyonu bul
        locationManager.requestWhenInUseAuthorization() // gerektiğinde lokasyonu takip et
        locationManager.startUpdatingLocation() // lokasyonu bulmayı başlat ve güncelle
        
        // uzunca basılınca işlemleri yap.
        let recognizer = UILongPressGestureRecognizer(target: self, action:  #selector(mapVC.chooseLocation(gestureRecognizer:)))
        
        recognizer.minimumPressDuration = 3 // kullanıcı en az 3 saniye basmalı
        
        mapView.addGestureRecognizer(recognizer) // ekleme işlemi
        
        
        // secili balık bos degilse
        if selectedTitle != ""{
            
            // Annotation oluşturup değerleri atama işlemleri yapılıyor.
            
            let annotation = MKPointAnnotation()
            let coordinate = CLLocationCoordinate2D(latitude: self.selectedLatitude, longitude: self.selectedLongitude)
            annotation.coordinate = coordinate
            annotation.title = self.selectedTitle
            annotation.subtitle = self.selectedSubtitle
            self.mapView.addAnnotation(annotation) // eklemeyi unutmamalıyız crash yeriz :)
            
            nameText.text = self.selectedTitle
            commentText.text = self.selectedSubtitle
        }
    }
    
    // seçilen lokasyonla ilgili işlemler yapılan metod
    
    @objc func chooseLocation(gestureRecognizer : UILongPressGestureRecognizer){
        
        // gestureRecognizer başladıysa
        if gestureRecognizer.state == UIGestureRecognizerState.began{
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView) //dokunulan yerin lokasyonu alınıyor.
            
            // secilen kordinat değerleri
            let choosenCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = choosenCoordinates.latitude // secilen enlem değeri
            chosenLongitude = choosenCoordinates.longitude // secilen boylam değeri
            
            let annotation = MKPointAnnotation() // annotation oluşturuluyor.
            annotation.coordinate = choosenCoordinates // kordinatlar ekleniyor.
            annotation.title = nameText.text // başlık veriliyor.
            annotation.subtitle = commentText.text // alt başlık veriliyor.
            self.mapView.addAnnotation(annotation) // annotation haritaya ekleniyor.
        }
    }
    
    
    // kullanıcının adresini alıp array halinde bizlere veriyor.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude) // lokasyonda bulunan enlem ve boylam değerlerini alıyoruz.
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05) // kaç boyutunda zoom yapılacak.
        
        let region = MKCoordinateRegion(center: location, span: span) // bulunduğumuz bölgeye lokasyon ve zoomlama giriliyor.
        
        mapView.setRegion(region, animated: true) // harita bölgeye eklendi.
    }
    
    // Pin özelleştirme işlemleri yapılıyor.
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let reuseID = "myAnnotation"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView?.canShowCallout = true
            pinView?.pinTintColor = UIColor.purple
            
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            
            pinView?.annotation = annotation
        }
        return pinView
    }
    
    // tasarlanan pindeki tuşa basıp gidilecek olan yerin rotasını veren işlemler
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if selectedLatitude != 0 {
            if selectedLongitude != 0{
                self.requestCLLocation = CLLocation(latitude: selectedLatitude, longitude: selectedLongitude)
                
            }
        }
        
        CLGeocoder().reverseGeocodeLocation(requestCLLocation) { (placemarks, error) in
            
            if let placemark = placemarks{
                
                if placemark.count > 0{
                    
                    let newPlacemark = MKPlacemark(placemark: placemark[0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.selectedTitle
                    
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeKey]
                    item.openInMaps(launchOptions : launchOptions)
                }
            }
        }
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) { // kaydetme işlemleri yapılıyor.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        
        do {
            try context.save()
            print("saved")
        } catch  {
            print("Error")
        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue : "newPlace"), object: nil)
        
        self.navigationController?.popViewController(animated: true)
        
    }
}

