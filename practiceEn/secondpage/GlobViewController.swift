//
//  GlobViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/11/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class GlobViewController: UIViewController {
    
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var txtView: UITextView!
    
    @IBAction func globbtn(_ sender: Any) {
        let a =  Auth.auth().currentUser?.uid
        ref.child("users").child(a!) .child("purpose").setValue(txtView.text)
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
