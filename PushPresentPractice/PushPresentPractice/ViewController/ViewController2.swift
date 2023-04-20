//
//  ViewController2.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController2: UIViewController {
    
    private let contentsView = ContentsView2()
    
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
        print("tap Push Btn in VC2")
        self.pushVC()
    }
    
    @objc func tapPresentBtn() {
        print("tap Present Btn in VC2")
        self.presentVC()
    }
    
    public func pushVC() {
        let vc = ViewController3()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func presentVC() {
        let navigationController = UINavigationController()
        let vc = ViewController3()
        navigationController.viewControllers = [vc]
        self.present(navigationController, animated: true, completion: nil)
    }
}
