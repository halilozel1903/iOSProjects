//
//  ViewController.swift
//  DatePickerViewApp
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePickerView: UITextField!
    
    // date picker nesnesi
    private var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // datepicker işlemleri
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ViewController.dataChanged(dataPicker:)), for: .valueChanged)
        
        // dokunma nesnesi oluşturuldu.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        // input değerini tarih değerine atadı.
        datePickerView.inputView = datePicker
    }
    
    // ekrana bir yere tıklayınca dataPicker kapanacak.
    @objc func viewTapped(gestureRecognizer:UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    // tarihi değiştirmek için kullanılan metod
    @objc func dataChanged(dataPicker: UIDatePicker){
        
        // formatlama işlemleri
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        datePickerView.text = dateFormatter.string(from: (datePicker?.date)!)
        view.endEditing(true)
        
    }
}

