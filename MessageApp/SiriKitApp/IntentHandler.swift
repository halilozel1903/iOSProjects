//
//  IntentHandler.swift
//  SiriKitApp
//
//  Updated by Halil Özel on 16.07.2022.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension, INSendMessageIntentHandling {
    
    // siriye söylenen mesaj ile ilgili işlemlerin yapıldığı alandır.
    func resolveContent(for intent: INSendMessageIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        if let content = intent.content{
            
            print("gelen bilgi : \(content)")
            
            let response = INStringResolutionResult.success(with: content)
            completion(response)
        }else{
            let response = INStringResolutionResult.needsValue()
            completion(response)
        }
        
    }
    
    // hesaplı işlemlerde giriş yapılıp yapılmadığını öğrenilen alandır.
    func confirm(intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Void) {
        
        let  isLogged = true
        
        // başarılı ise
        if isLogged{
            
            completion(INSendMessageIntentResponse(code: .success, userActivity: nil))
            
        }
        
        // başarısız ise
        else{
            let response = INSendMessageIntentResponse(code: .failureRequiringAppLaunch, userActivity: nil)
            completion(response)
        }
        
    }
    
    // kullanıcıdan gerekli izinler alındıktan sonra mesaj yollanılır.
    func handle(intent: INSendMessageIntent, completion: @escaping (INSendMessageIntentResponse) -> Void) {
        
    }
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return self
    }
}

