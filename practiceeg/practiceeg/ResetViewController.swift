//
//  ResetViewController.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/17.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func reset(_ sender: Any) {
        if self.emailTextField.text == "" {
            //彈出警告
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            //發出重置密碼信件
           
                //彈出視窗告訴使用者成功與否
                var title = ""
                var message = ""
                
                if (false) {
                    title = "Error!"
                    message = ""
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                    //成功後回前頁
                    self.dismiss(animated: true, completion: nil)
                })
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
