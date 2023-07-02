//
//  startViewController.swift
//  CropPickerView_Example
//
//  Created by 강조은 on 2023/07/01.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class startViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker.delegate = self
    }
    
    @IBAction func btn(_ sender: Any) {
        openPhotoLibrary()
    }
    /**
     아이폰에서 앨범에 접근하는 함수
     */
    private func openPhotoLibrary() {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .currentContext
            self.present(self.imagePicker, animated: true, completion: nil)
        } else {
            print("앨범에 접근할 수 없습니다.")
        }
    }
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let image = info[.originalImage] as? UIImage else { return }
        picker.dismiss(animated: true) {}
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.image = image
        self.present(vc, animated: true)
    }
}
