//
//  SecondpageViewController.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/10/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class SecondpageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    
    var name = ["ImageData","Name","Email","Password","Gender","Learning purpose"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)as! ImageCell
            
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
        if indexPath.row == 1{
            performSegue(withIdentifier: "name", sender: Any.self)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: "email", sender: Any.self)
        }else if indexPath.row == 3{
            performSegue(withIdentifier: "password", sender: Any.self)
        }else if indexPath.row == 5{
            performSegue(withIdentifier: "glob", sender: Any.self)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.tableFooterView = UIView()
        
        

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
