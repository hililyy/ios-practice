//
//  HomeNC.swift
//  Pagination
//
//  Created by 강조은 on 2023/10/23.
//

import UIKit

final class HomeNC: UINavigationController, UIGestureRecognizerDelegate {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            return self.viewControllers.count > 1
        }
        
        interactivePopGestureRecognizer?.delegate = self
        navigationBar.isHidden = true
        self.setViewControllers([HomeVC()], animated: true)
    }
}
