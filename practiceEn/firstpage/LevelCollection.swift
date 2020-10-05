//
//  LevelCollection.swift
//  practiceEn
//
//  Created by zencher on 2020/10/2.
//  Copyright © 2020 zencher. All rights reserved.
//

import UIKit





class LevelCollection: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate{
    
    
    
   
    
    
    
    var levelImages:[UIImage] = [
        UIImage(named: "level1")!,
        UIImage(named: "level2")!,
        UIImage(named: "level3")!,
    ]
    var arrayofIDs = [String]()
    
        
    override func awakeFromNib() {
        self.delegate = self
        self.dataSource = self
        let flow = self.collectionViewLayout as! UICollectionViewFlowLayout
        //水平间隔
        flow.minimumInteritemSpacing = 0.0
        //垂直行间距
        flow.minimumLineSpacing = 25.0
        flow.sectionInset = UIEdgeInsets(top: 10, left:40, bottom: 0, right: 40)
       arrayofIDs = ["A","B"]
        
       }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelImages.count
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
        let name = arrayofIDs[indexPath.row]
        let controller = UIStoryboard.init(name: "Firstpage", bundle: nil).instantiateViewController(identifier: name)
        self.window?.rootViewController = UINavigationController(rootViewController:controller)
       
        
       
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
