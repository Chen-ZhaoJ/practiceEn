//
//  PersonViewController.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/17.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logout(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        if true {
            do {
                //try Auth.auth().signOut()
                dismiss(animated: true, completion: nil)
            }
            catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        userDefaults.set(false, forKey: "isLogined")
        userDefaults.synchronize()
        _ = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
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
