//
//  PinchTestViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/08/04.
//

import UIKit

class PinchTestViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var maximumZoomScale = 3.0
    var minimumZoomScale = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "byulee.jpeg")
        imageView.isUserInteractionEnabled = true // default: false
        
        let pinchRecogniezer = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction(_ :)))
        imageView.addGestureRecognizer(pinchRecogniezer)
    }
    
    @objc func pinchAction(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            
            let currentScale = imageView.frame.size.width / imageView.bounds.size.width
            let newScale = currentScale * sender.scale
            
            let scaledValue = min(max(newScale, minimumZoomScale), maximumZoomScale)
            imageView.transform = CGAffineTransform(scaleX: scaledValue, y: scaledValue)
            
            sender.scale = 1.0
        }
    }
}
