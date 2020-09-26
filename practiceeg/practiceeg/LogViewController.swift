//
//  LogViewController.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/16.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func LoginAction(_ sender: Any) {
        if self.emailTextField.text == "" || self.passwordTextField.text == "" {
            //彈出警告
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            //登入
            if(1==1){
                    //登入成功，進入下頁
                    let userDefaults = UserDefaults.standard
                    _ = userDefaults.value(forKey: "isLogined") as? Bool
                    userDefaults.set(true, forKey: "isLogined")
                    _ = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC")
                    // dismiss把畫面砍掉 表示再出現的時候會在viewdidload一次
                    self.dismiss(animated: true, completion: nil)
                    //                    self.present(vc!, animated: true, completion: nil)
            }else{
                    //登入失敗，彈出警告
                    let userDefaults = UserDefaults.standard
                    _ = userDefaults.value(forKey: "isLogined") as? Bool
                    userDefaults.set(false, forKey: "isLogined")
                    let alertController = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    //叫出新的畫面
                    self.present(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.placeholder = "信箱"
        passwordTextField.placeholder = "密碼"
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.init(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.init(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissNext2(segue:UIStoryboardSegue){
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
