//
//  SwipeSecondViewController.swift
//  CameraTest
//
//  Created by 강조은 on 2023/08/04.
//

import UIKit

class SwipeSecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_:)))
        swipeRecognizer.direction = .right
        self.view.addGestureRecognizer(swipeRecognizer)
    }
    
    @objc func swipeAction(_ sender :UISwipeGestureRecognizer) {
        if sender.direction == .right {
            tabBarController?.selectedIndex = 0
        }
    }
}
