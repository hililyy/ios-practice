//
//  ResultViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/07/27.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var resultImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = resultImage
//        imageView.transform.rotated(by: CGFloat.pi / 2)
//        image.draw(at: CGPoint.zero)
    }
}
