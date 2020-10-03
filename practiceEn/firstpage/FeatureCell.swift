//
//  FeatureCell.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class FeatureCell: UITableViewCell {
    
   
    
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
