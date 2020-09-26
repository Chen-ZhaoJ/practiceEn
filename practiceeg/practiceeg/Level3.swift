//
//  Level3.swift
//  practiceeg
//
//  Created by 陳昭潔 on 2020/9/16.
//  Copyright © 2020 陳昭潔. All rights reserved.
//

import UIKit

class Level3: UIViewController,UITabBarControllerDelegate,UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    let fullScreenSize = UIScreen.main.bounds.size

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    @IBOutlet weak var hinttext: UILabel!
    @IBAction func invitebtn(_ sender: Any) {
        hinttext.isHidden=false
    }
    @IBOutlet weak var popview: UIView!
    @IBAction func xbtn(_ sender: Any) {
        popview.isHidden=true
        hinttext.isHidden=true
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        popview.isHidden=false
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
         if let index = tabBarController.viewControllers?.index(of: viewController){
             if index == 2 && tabBarController.selectedViewController == viewController{
                 if let navi = self.navigationController {
                     navi.viewControllers = [navi.viewControllers[0]]
                 }
             }
         }
     }
    /*
       override func viewDidAppear(_ animated: Bool) {
           let userDefaults = UserDefaults.standard
           var isLogined = userDefaults.value(forKey: "isLogined") as? Bool
           if isLogined != nil && isLogined! {
               print("123")
           }
           else{
               print("456")
               var logVC = self.storyboard?.instantiateViewController(withIdentifier: "LogVC")
               present(logVC!, animated: true, completion: nil)
           }
       }*/
    override func viewDidLoad() {
        navigationController?.navigationBar.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
       // setUpSearchBar()
        var layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        //layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 40)/2 , height: (self.collectionView.frame.size.height - 80)/3)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
        layout.itemSize = CGSize(width: fullScreenSize.width/2-20, height: 150) //設定cell的size
        layout.minimumLineSpacing = 12 //設定cell與cell間的縱距

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    let names = ["Name1", "Name2", "Name3", "Name4", "Name5", "Name6", "Name7", "Name8"]
    
    let images: [UIImage] = [
        UIImage(named: "123")!,
        UIImage(named: "Formosa")!,
        UIImage(named: "123")!,
        UIImage(named: "Formosa")!,
        UIImage(named: "123")!,
        UIImage(named: "Formosa")!,
        UIImage(named: "123")!,
        UIImage(named: "Formosa")!
    ]
    
    let scores = ["1","2","3","4","5","6","7","8"]
    
    let genders = ["male","female","male","female","male","female","male","female"]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HomeCollectionViewCell
        cell.nameLabel.text = names[indexPath.item]
        cell.imageView.image = images[indexPath.item]
        cell.scoreLabel.text = scores[indexPath.item]
        cell.genderLabel.text = genders[indexPath.item]
        cell.backgroundColor = .orange
        let editButton = UIButton(frame: CGRect(x:0, y:0, width:fullScreenSize.width/2-20,height:150))
        editButton.setImage(UIImage(named: "editButton.png"), for: UIControl.State.normal)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)
        //editButton.setTitle("\(indexPath.row)", for: .normal)
        //editButton.backgroundColor = .red
        editButton.tag = indexPath.row
        editButton.isUserInteractionEnabled = true
        cell.addSubview(editButton)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
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
