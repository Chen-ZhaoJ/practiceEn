//
//  HomeTable.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth




class HomeTable: UIViewController,UITableViewDelegate,UITableViewDataSource,YourCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func didPressCelltwo(sender: Any) {
        let controller = UIStoryboard.init(name: "Firstpage", bundle: nil).instantiateViewController(identifier: "LevelTwoViewController") as! LevelTwoViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    func didPressCellthree(sender: Any) {
        
        let controller = UIStoryboard.init(name: "Firstpage", bundle: nil).instantiateViewController(identifier: "LevelOneViewController") as! LevelOneViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
    func didPressCellone(sender: Any) {
        let controller = UIStoryboard.init(name: "Firstpage", bundle: nil).instantiateViewController(identifier: "SINViewController") as! SINViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    

    var userData = [String]()
    var ref: DatabaseReference!
    var db: DatabaseReference!

    
    
    @IBOutlet weak var tableView: UITableView!
    
   
      
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.systemGray6
    
        ref = Database.database().reference()
        let usersRef = self.ref.child("users").child(Auth.auth().currentUser!.uid)
        usersRef.observe(.childAdded, with: {  (snapshot) in
            let uploadData = snapshot.value as? String

            if let actualUser = uploadData {
                self.userData.append(actualUser)
                let path = IndexPath(row:0, section: 0)
                let cell = self.tableView.cellForRow(at: path) as! FeatureCell
                cell.username.text = self.userData[0]
                self.tableView.reloadData()
                
               

            }

        })
        
      
        

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print("裡面的資料\(self.userData)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath)as! FeatureCell
//            cell.layer.backgroundColor = UIColor.orange.cgColor
            cell.isUserInteractionEnabled = false
            
            
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)as! CategoryCell
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
   

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
