//
//  PushViewController.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

final class PushViewController: UIViewController {

    private let pushView = PushView()
    
    override func loadView() {
        view = pushView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    func setAddTarget() {
        pushView.pushBtn.addTarget(self, action: #selector(tapPresentBtn), for: .touchUpInside)
    }
    
    @objc func tapPresentBtn() {
        print("tap push button in UIViewController")
    }
}
