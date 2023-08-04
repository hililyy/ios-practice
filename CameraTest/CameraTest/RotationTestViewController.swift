//
//  RotationTestViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/08/04.
//

import UIKit

class RotationTestViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var rotationRecognizer: UIPinchGestureRecognizer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "byulee.jpeg")
        imageView.isUserInteractionEnabled = true
        
        let rotationRecogniezer = UIRotationGestureRecognizer(target: self, action: #selector(rotationAction(_ :)))
        
        imageView.addGestureRecognizer(rotationRecogniezer)
    }
    
    @objc func rotationAction(_ sender: UIRotationGestureRecognizer) {
        imageView.transform = imageView.transform.rotated(by: sender.rotation)
        
        sender.rotation = 0.0 // 이 값이 커질수록 조금만 돌려도 많이 돌아감 (0에 가까울 수록 조금 돌아감)
    }
}
