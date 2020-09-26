//
//  HomeCollectionViewCell.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/16.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    var index = 0
    var delegte: CollectionViewCellDelegte? = nil

   /*
    @IBAction func buttonAction(_ sender: UIButton) {
        if let del = self.delegte {
            del.collectionViewCellDelegte(didClickButtonAt: index)
        }
    }
 */
}
protocol CollectionViewCellDelegte {
    func collectionViewCellDelegte(didClickButtonAt index: Int)
}
