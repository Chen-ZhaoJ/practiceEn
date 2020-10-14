//
//  SINViewController.swift
//  practiceEn
//
//  Created by zencher on 2020/10/14.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class SINViewController: UIViewController {

    @IBAction func LognIn(_ sender: Any) {
        let manager = SINClientManager.sharedManager
        
        if let username = (sender as? UIButton)?.title(for: .normal), let userId = manager.getUserId(withUsername: username), manager.client(withUserId: userId) != nil {
        
            //開始觀察
           NotificationCenter.default.addObserver(self, selector: #selector(self.clientDidStart(_:)), name: .clientDidStart, object: nil)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func clientDidStart(_ notification: Notification) {
        self.performSegue(withIdentifier: "Login", sender: self)
        
        NotificationCenter.default.removeObserver(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
