//
//  MenuViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/18.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func goCamera(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func goAlbum(_ sender: Any) {
        didTapButton()
    }
}

extension MenuViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        picker.dismiss(animated: true)
        showEditImage(image)
    }
    
    private func showEditImage(_ image: UIImage) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CropViewController") as! CropViewController
        vc.modalPresentationStyle = .fullScreen
        vc.image = image
        self.present(vc, animated: true)
    }
}
