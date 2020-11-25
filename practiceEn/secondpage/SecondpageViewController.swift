//
//  SecondpageViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/10/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase



class SecondpageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate ,DataEnteredDelegate {
    
    func userDidEnterInformation(nameData: [String]) {
        detail = nameData
     
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
 
    var name = ["ImageData","Email","Gender","name","Learning purpose"]
    var detail = [String]()
    var genderdetail = [String]()
    var namedetail:String = ""
    var num:Int = 0

    var selectedImageFromPicker: UIImage?
    var ref: DatabaseReference!
    

    // MARK: - TableViewDataSource
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)as! ImageCell
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)as! DataCell
            cell.titleLabel.text = name[indexPath.item]
            DispatchQueue.main.async {
                
                    
            cell.detailLabel.text = self.detail[indexPath.item-1]
              
            }
                                    
        
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0{
            pickImage()
        }
        if indexPath.row == 3{
           num = 3
            performSegue(withIdentifier: "name", sender: Any.self)
            
            
        }else if indexPath.row == 4{
            performSegue(withIdentifier: "glob", sender: Any.self)
            ref = Database.database().reference()
            let usersRef = self.ref.child("users").child(Auth.auth().currentUser!.uid)
            usersRef.observe(.childChanged, with: {  (snapshot) in
                let uploadData = snapshot.value as? String
                if let actualUser = uploadData {
//                    self.detail.insert("", at: 4)
//                    self.detail.insert(actualUser, at: 3)
//                    self.detail.remove(at: 4)
                    
                }
            })
            
           
        }else if indexPath.row == 2{
            num = 2
            
            self.performSegue(withIdentifier: "gender", sender: Any.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)as! DataCell
            DispatchQueue.main.async {
//                cell.detailLabel.text = self.genderdetail[indexPath.item-1]
            }
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = UIColor.systemGray6
        tableview.estimatedRowHeight = 50.0
        tableview.rowHeight = UITableViewAutomaticDimension
        ref = Database.database().reference()
        let usersRef = self.ref.child("users").child(Auth.auth().currentUser!.uid)
        usersRef.observe(.childAdded, with: {  (snapshot) in
            let uploadData = snapshot.value as? String
            if let actualUser = uploadData {
                self.detail.append(actualUser)
               
                print("裡面資料\(self.detail)")
                
                
            }
        })
        self.tableview.reloadData()
        
    }
   
    @IBAction func signOut(_ sender: Any) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        if num == 2 {
            
            ref = Database.database().reference()
                              let usersRef = self.ref.child("users").child(Auth.auth().currentUser!.uid)
                              usersRef.observe(.childChanged, with: {  (snapshot) in
                                  let uploadData = snapshot.value as? String
                                  if let actualUser = uploadData {
                                   self.detail.insert(actualUser, at: 1)
                                   self.detail.remove(at: 2)
                                    self.genderdetail = self.detail
                                    print("二度載入裡面資料gender\(self.genderdetail)")
                                  }
                              })
                              self.tableview.reloadData()
                              
                   
        }
      
//        if num == 3 {
//            ref = Database.database().reference()
//                       let usersRef = self.ref.child("users").child(Auth.auth().currentUser!.uid)
//                       usersRef.observe(.childChanged, with: {  (snapshot) in
//                                 let uploadData = snapshot.value as? String
//                                 if let actualUser = uploadData {
//                                    self.namedetail = actualUser
//                                    self.detail.insert(self.namedetail, at: 2)
//                                    self.detail.remove(at: 3)
//
//
//                                 }
//                             })
//            tableview.reloadData()
//
//                             print("二度載入裡面資料name\(detail)")
//
//
//        }
//


        print(num)
       
      
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "name" {
            let cv = segue.destination as! NameViewController
            cv.nameDetail = detail
           
            
        }
        
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - ImagePickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            selectedImageFromPicker = pickedImage
            let path = IndexPath(row:0, section: 0)
            let cell = tableview.cellForRow(at: path) as! ImageCell
            cell.personalImage.image = pickedImage
            cell.personalImage.clipsToBounds = true
        
            
            }
        let uniqueString = Auth.auth().currentUser?.email
        if let selectedImage = selectedImageFromPicker {
            let  storageRef = Storage.storage().reference().child("AppCodaUpload").child("\(uniqueString ?? "the lat in the dictionary was nil!").png")
            //轉為String
            if let uploadData = UIImagePNGRepresentation(selectedImage) {
                storageRef.putData(uploadData, metadata: nil, completion: { (data, error) in
                           
                           if error != nil {
                               
                               // 若有接收到錯誤，我們就直接印在 Console 就好，在這邊就不另外做處理。
                               print("Error: \(error!.localizedDescription)")
                               return
                           }
                           
                           // 連結取得方式就是：data?.downloadURL()?.absoluteString。
                    storageRef.downloadURL(completion: { (url, error) in
                        
                        print("Image URL: \((url?.absoluteString)!)")
                        let databaseRef = Database.database().reference().child("users").child("\(Auth.auth().currentUser!.uid)ImageUrl").child("profileImageUrl")
                        databaseRef.setValue(url?.absoluteString, withCompletionBlock: { (error, dataRef) in
                                                
                            if error != nil {
                                                    
                                print("Database Error: \(error!.localizedDescription)")
                                            }
                            else {
                                                    
                                print("圖片已儲存")
                                }
                                                
                        })
                    })
                    
                })
            }
                    
//            print("\(uniqueString), \(selectedImage)")
        }
       
        
        tableview.reloadData()
        picker.dismiss(animated: true, completion: nil)
        }
   
    
}
