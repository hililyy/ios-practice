//
//  ViewController3.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController3: UIViewController {
    
    private let contentsView = ContentsView()
    
    override func loadView() {
        view = contentsView
        view.backgroundColor = .green
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
        self.pushVC()
    }
    
    @objc func tapPresentBtn() {
        self.presentVC()
    }
}

extension ViewController3: ViewProtocol {
    
    public func pushVC() {
        print("func start Push Btn in VC3")
        let vc = ViewController4()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func presentVC() {
        print("func start Present Btn in VC3")
        let navigationController = UINavigationController()
        let vc = ViewController4()
        navigationController.viewControllers = [vc]
        self.present(navigationController, animated: true, completion: nil)
    }
}
