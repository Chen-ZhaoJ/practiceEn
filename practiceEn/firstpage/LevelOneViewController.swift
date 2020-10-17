//
//  LevelOneViewController.swift
//  practiceEn
//
//  Created by zencher on 2020/10/3.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class LevelOneViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       

    }
    @objc func swipe(recognizer:UISwipeGestureRecognizer) {
        print("right")
         
      
       
       
//        let controller = UIStoryboard.init(name: "Firstpage", bundle: nil).instantiateViewController(identifier: "FirstpageViewController") as! FirstpageViewController
//        self.navigationController?.pushViewController(controller, animated: true)
//        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "TabBarController") as! UITabBarController
//               self.navigationController?.pushViewController(controller, animated: true)
//       

    }
    override func viewDidAppear(_ animated: Bool) {
        
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
