//
//  ResultViewController.swift
//  crop
//
//  Created by 강조은 on 2023/07/03.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var img: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = img
    }
}
