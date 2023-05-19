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
//    @IBAction func crop(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "CropViewController") as? CropViewController else { return }
//        
//        vc.cropwillImage = myImage
//        vc.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(vc, animated: true)
//        
//    }
}
