//
//  HomeTable.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit




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
    
    
    

    
    @IBOutlet weak var tableView: UITableView!
    
   
      
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.systemGray6
    }
    override func viewWillAppear(_ animated: Bool) {
      
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
//            cell.isUserInteractionEnabled = false
            cell.isUserInteractionEnabled = true
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)as! CategoryCell
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            pickImage()
        }
//        tableView.deselectRow(at: indexPath, animated: true)

    }
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
