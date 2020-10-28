//
//  SecondpageViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/10/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit


class SecondpageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
 
    var name = ["ImageData","Name","Email","Gender","Learning purpose"]
    var detail = ["jpg","Lily","dorothy1290@gmail.com","F","My name is Lily. I was born on August 8, 1986. I am 25 years old. There are 4 people in my family, including my father, my mother, my sister, and me. I study in Ta-an Vocational High School. My favorite subject is English. My favorite person is Kobe Bryant because of his skill in basketball. My favorite song is “Memory”. Pizza is my favorite food. Discovery is my favorite TV program. I like to watch TV and play basketball in free time. In the future, I want to be an engineer. "]

   
   
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
            print(cell.personalImage.image)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)as! DataCell
            cell.titleLabel.text = name[indexPath.item]
            cell.detailLabel.text = name[indexPath.item]
           
            return cell
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row == 0{
            pickImage()
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "name", sender: Any.self)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: "email", sender: Any.self)
        }else if indexPath.row == 4{
            performSegue(withIdentifier: "glob", sender: Any.self)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        tableview.backgroundColor = UIColor.systemGray6
        tableview.estimatedRowHeight = 50.0
        tableview.rowHeight = UITableViewAutomaticDimension

        // Do any additional setup after loading the view.
    }
   
    @IBAction func signOut(_ sender: Any) {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
           
            let path = IndexPath(row:0, section: 0)
            let cell = tableview.cellForRow(at: path) as! ImageCell
                cell.personalImage.image = pickedImage
           
                cell.personalImage.clipsToBounds = true
           
            }
        
        
            tableview.reloadData()
            picker.dismiss(animated: true, completion: nil)
        }
    
}
