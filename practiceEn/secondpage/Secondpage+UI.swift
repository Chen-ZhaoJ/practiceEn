//
//  Secondpage+UI.swift
//  practiceEn
//
//  Created by 蔡佳玲 on 2020/10/25.
//  Copyright © 2020 zencher. All rights reserved.
//

extension SecondpageViewController{
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
}
