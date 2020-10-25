//
//  DataCell.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/10/25.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
