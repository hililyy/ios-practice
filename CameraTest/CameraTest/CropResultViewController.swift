//
//  CropResultViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/19.
//

import UIKit

class CropResultViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var img: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = img
    }
}
