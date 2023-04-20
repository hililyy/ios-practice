//
//  PresentViewController.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

final class PresentViewController: UIViewController {
    
    private let presentView = PresentView()
    
    override func loadView() {
        view = presentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    func setAddTarget() {
        presentView.presentBtn.addTarget(self, action: #selector(tapPresentBtn), for: .touchUpInside)
    }
    
    @objc func tapPresentBtn() {
        print("tap present button")
    }
}
