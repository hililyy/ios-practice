//
//  ViewController5.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController5: UIViewController {
    
    private let contentsView = ContentsView5()
    
    override func loadView() {
        view = contentsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    func setAddTarget() {
        contentsView.pushBtn.addTarget(self, action: #selector(tapPushBtn), for: .touchUpInside)
        contentsView.presentBtn.addTarget(self, action: #selector(tapPresentBtn), for: .touchUpInside)
    }
    
    @objc func tapPushBtn() {
        print("tap Push Btn in VC5")
    }
    
    @objc func tapPresentBtn() {
        print("tap Present Btn in VC5")
    }
}
