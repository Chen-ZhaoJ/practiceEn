//
//  NameViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/11/24.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

protocol DataEnteredDelegate: class {
    func userDidEnterInformation(nameData: [String])
}

class NameViewController: UIViewController {
    var ref = Database.database().reference()
    var nameDetail = [String]()
    
   
    
    weak var delegate: DataEnteredDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nametxt: UITextField!
    

    @IBAction func finishbtn(_ sender: Any) {
        let a =  Auth.auth().currentUser?.uid
        ref.child("users").child(a!) .child("name").setValue(nametxt.text)
        
        navigationController?.popViewController(animated: true)
       
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

           
        
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
