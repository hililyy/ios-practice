//
//  SwipeFirstViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/08/04.
//

import UIKit

class SwipeFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_ :)))
        swipeRecognizer.direction = .left
        self.view.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func swipeAction(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            tabBarController?.selectedIndex = 1
        }
    }
}
