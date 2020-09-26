//
//  ViewController.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/8/12.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
         super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        var isLogined = userDefaults.value(forKey: "isLogined") as? Bool
        if isLogined != nil && isLogined! {
            print("123")
        }
        else{
            print("456")
            let logVC = self.storyboard?.instantiateViewController(withIdentifier: "LogVC")
            present(logVC!, animated: true, completion: nil)
 
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as? Level1
        if segue.identifier == "seguel1"{
            controller?.test = 1
        }else if segue.identifier == "seguel2"{
            controller?.test = 2
        }else if segue.identifier == "seguel3"{
            controller?.test = 3
        }else if segue.identifier == "seguel4"{
            controller?.test = 4
        }else if segue.identifier == "seguel5"{
            controller?.test = 5
        }
    }
    @IBAction func dismissNext(segue:UIStoryboardSegue){
    }
}

