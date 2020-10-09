//
//  AppDelegate.swift
//  practiceEn
//
//  Created by zencher on 2020/9/29.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate ,SINClientDelegate,SINCallDelegate{
    
    var window: UIWindow?
    var client: SINClient?
    
    func clientDidStart(_ client: SINClient!) {
        print("clientDidStart")
        NotificationCenter.default.post(name: .SINClientDidStart, object: nil)
    }
    
    func clientDidFail(_ client: SINClient!, error: Error!) {
        print("clientDidFail \(error.localizedDescription)")
    }
    
    
    func client(_ client: SINCallClient!,didReceiveIncomingCall  call: SINCall!) {
        print("didReceiveIncomingCall")
        NotificationCenter.default.post(name: .didReceiveIncomingCall, object: call, userInfo: nil)
    }
    
    
   



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
   

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
extension Notification.Name {
    static let clientDidStart = Notification.Name("SINCLIENT_DID_START")
    static let didReceiveIncomingCall = Notification.Name("SINCLIENT_DID_RECEIVE_INCOMING_CALL")
    
}

