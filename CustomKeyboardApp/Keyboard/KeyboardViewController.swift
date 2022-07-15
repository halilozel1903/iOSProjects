//
//  KeyboardViewController.swift
//  Keyboard
//
//  Refactored by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    var keyboardView : UIView! // keyboard değişkeni tanımlandı.
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        loadInterface()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    // klavyenin yüklenmesi ve ekranda gösterilme işlemleri
    func loadInterface() {
        
        let numberKeyboardNib = UINib(nibName: "NumberKeyboard", bundle: nil)
        
        keyboardView = numberKeyboardNib.instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.addSubview(keyboardView)
    }
    
    
    // klavyeye tıklanınca sayıları arama ekranında gösterme işlemleri
    @IBAction func didSelectedButton(_ sender: UIButton) {
        
        var proxy = textDocumentProxy as UITextDocumentProxy
        
        if let text = sender.title(for: .normal){
            proxy.insertText(text)
        }
    }
}
