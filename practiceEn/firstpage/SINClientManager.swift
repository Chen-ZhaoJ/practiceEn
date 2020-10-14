//
//  SINClientManager.swift
//  practiceEn
//
//  Created by zencher on 2020/10/14.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class SINClientManager: NSObject {
    static let sharedManager = SINClientManager()

    private weak var appDelegate: AppDelegate!

    var currentClient: SINClient? {
        get {
            return appDelegate.client
        }
    }
    
    private override init() {
        super.init()
        
        self.appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    }
    var users = ["a": "Amy", "b": "Lily", "c": "Peter", "d": "John"]
    
    
    func client(withUserId userId: String) -> SINClient? {
        if self.appDelegate.client == nil {
            if let client = Sinch.client(withApplicationKey: "d8d686d1-1830-48e9-8b27-6d41e2373890", applicationSecret: "hRznYkwcA0SLWpXKQjhWsg==", environmentHost: "clientapi.sinch.com", userId: userId) {
            
                client.setSupportCalling(true)
                //client.setSupportMessaging(true)
                
                client.enableManagedPushNotifications()
                
                client.delegate = self.appDelegate
                client.call().delegate = self.appDelegate 
                //client.messageClient().delegate = self.appDelegate
                
                client.start()
                client.startListeningOnActiveConnection()
            
                self.appDelegate.client = client
            }
        }
        
        return self.appDelegate.client
    }
    
    func logout() {
        if let client = self.appDelegate.client {
            client.stopListeningOnActiveConnection()
            client.terminate()
        }
        
        self.appDelegate.client = nil
    }
    
    func getUserId(withUsername username: String) -> String? {
        let keys = Array(users.keys)
        
        for key in keys {
            if users[key] == username {
                return key
            }
        }
        
        return nil
    }
    
    func getUsername(withUserId userId: String) -> String? {
        return users[userId]
    }

}
