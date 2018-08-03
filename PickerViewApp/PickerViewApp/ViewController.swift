//
//  ViewController.swift
//  PickerViewApp
//
//  Created by Halil Özel on 3.08.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    let pickerData = ["Türkiye","Almanya","Brezilya","Şili","Portekiz","İspanya","Kanada","Hollanda","Hırvatistan"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }


    // 1 başlık altında listeleme işlemleri
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    // kaç edat eleman olacak
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    // başlık bilgilerinin gösterildiği yer
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    // eleman seçiminde neler olacak
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Seçilen ülke : \(pickerData[row])")
    }

}

