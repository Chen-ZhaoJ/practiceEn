//
//  GenderViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/11/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class GenderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var gender = String()
    var ref = Database.database().reference()
    
    @IBAction func genderChose(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            gender = "Male"
        case 1:
            gender = "Female"
        default:
            break
        }
        
    }
    
    @IBAction func savebtn(_ sender: Any) {
        let a =  Auth.auth().currentUser?.uid
        ref.child("users").child(a!) .child("gender").setValue(gender)
        
        navigationController?.popViewController(animated: true)
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
