//
//  CategoryCell.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit

protocol YourCellDelegate: NSObjectProtocol{
    func didPressCellone(sender: Any)
    func didPressCelltwo(sender: Any)
    func didPressCellthree(sender: Any)
    
    
}

class CategoryCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var delegate:YourCellDelegate!
    
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
        cell.layer.cornerRadius = 10
       
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
            
            delegate.didPressCellone(sender: indexPath.item)

        }else if indexPath.item == 1 {
            delegate.didPressCelltwo(sender: indexPath.item)
            print("2")
        }else if indexPath.item == 2 {
            print("3")
        }
        
        
       
       
       
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.white.cgColor
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
        layout.sectionInset = UIEdgeInsets(top: 10, left: 40, bottom: 0, right: 40)
        //垂直行间距
        layout.minimumLineSpacing = 20
        //水平间隔
        layout.minimumInteritemSpacing = 0
           
        layout.itemSize.height = self.frame.height/4.5
        layout.itemSize.width = self.frame.height/4.5
        

        collectionView.collectionViewLayout = layout
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
