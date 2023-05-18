//
//  ResultViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/18.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    
    
    var myImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultImage.image = myImage
    }
    
}
