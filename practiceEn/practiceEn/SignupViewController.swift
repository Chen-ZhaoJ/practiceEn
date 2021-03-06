//
//  SignupViewController.swift
//  practiceEn
//
//  Created by zencher on 2020/9/29.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase


class SignupViewController: UIViewController {
    var a = 0
    lazy var ref = Database.database().reference()
    let actionCodeSettings = ActionCodeSettings()
    @IBAction func createAction(_ sender: Any) {
        let u = validatePassword(passwd: emailTextField.text!)
        
        if emailTextField.text == "" || passwordTextField.text != retypepassword.text || u != "OK" {
            //彈出警告
            let alertController = UIAlertController(title: "Error", message: "your email is empty or Security issue", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        } else {
            //Auth.auth().sendSignInLink(toEmail: emailTextField.text!, actionCodeSettings: actionCodeSettings, completion: nil)
            //建立帳號
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error == nil  {
                    //建立成功
                    let alertController = UIAlertController(title: "Success", message:"You have successfully signed up", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                        //成功後回前頁
                        
                        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
                        self.navigationController?.pushViewController(controller, animated: true)
                        //self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    //        ref.setValue(["Label": textField.text])
                    //        加到child 節點下面
                    //        ref.child("Child").setValue(["Label": textField.text])
//                    self.ref.childByAutoId().setValue(["Label": self.username.text])
//                    self.aaa()
                } else {
                    //建立失敗，跳出警告
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                if let userData = user {
//                    print(userData.user.email)
                    let dict: Dictionary<String,Any> = [
                        "name": userData.user.uid,
                        "email": userData.user.email!,
                        "gender": "please enter infromation",
                        "purpose": "please enter infromation"
                    ]
                    Database.database().reference().child("users").child(userData.user.uid).updateChildValues(dict) { (error, ref) in
                        if error == nil {

                            print("Done")
                        }
                    }
                }
                
            }
        }
    }
    
//    func aaa(){
//        var refHandle = ref.observe(DataEventType.value, with: {(snapshot) in
//            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
////            self.username.text = postDict["Label"] as? String
//            print(postDict["Label"])
//        })
//        // Do any additional setup after loading the view.
//
//    }
    func validatePassword(passwd:String)-> String{
        var r = "No"
        var isLongEnough:Bool = false
        var hasUppercase = false
        var hasLowercase = false
        var hasNumber = false
        if passwd.count >= 8 {
            isLongEnough = true
        }
        for char:Character in passwd {
            let str:String = "\(char)"
            let num:Int? = Int(str)
            if (str.uppercased() == str) && (Int(str) == nil) {
                hasUppercase = true
            }
            if (str.lowercased() == str) && (Int(str) == nil)  {
                hasLowercase = true
            }
            if num == num{
                hasNumber = true
            }else{
                hasNumber = false
            }
        }
        if isLongEnough && hasNumber && hasUppercase && hasLowercase {
            r = "OK"
        }
        return r
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypepassword: UITextField!
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
}
