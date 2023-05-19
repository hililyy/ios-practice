//
//  ViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/18.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    override func viewDidLoad() {
        
    }
    
    @IBAction func goCamera(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as? CameraViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
