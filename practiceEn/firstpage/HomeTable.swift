//
//  HomeTable.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit




class HomeTable: UITableView,UITableViewDelegate,UITableViewDataSource {
    
    

    
    
      override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        
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
            cell.layer.backgroundColor = UIColor.lightGray.cgColor
            cell.isUserInteractionEnabled = false
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)as! CategoryCell
            
          
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
