//
//  CategoryCell.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit



class CategoryCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    var levelImages:[UIImage] = [
        UIImage(named: "level1")!,
        UIImage(named: "level2")!,
        UIImage(named: "level3")!,
    ]
    var arrayofIDs = [String]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelImages.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCell
        cell.levelImageView.image = levelImages[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
        
        
       
        print("你選擇了第 \(indexPath.section + 1) 組的")
        print("第 \(indexPath.item + 1) ")
        
        if indexPath.item == 0 {
            print("1")
            
            
        }else if indexPath.item == 1 {
            print("2")
        }else if indexPath.item == 2 {
            print("3")
        }
        
        
       
       
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        arrayofIDs = ["A","B","C"]
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 70)
        //垂直行间距
        layout.minimumLineSpacing = 10
        //水平间隔
        layout.minimumInteritemSpacing = 5.0
           
        layout.itemSize.height = self.frame.height/4
        layout.itemSize.width = self.frame.height/4

        collectionView.collectionViewLayout = layout
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
