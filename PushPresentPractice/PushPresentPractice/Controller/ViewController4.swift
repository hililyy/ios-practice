//
//  ViewController4.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController4: UIViewController {
    
    private let contentsView = ContentsView()
    
    override func loadView() {
        view = contentsView
        view.backgroundColor = .blue
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

extension ViewController4: ViewProtocol {
    
    public func pushVC() {
        print("func start Push Btn in VC4")
        let vc = ViewController5()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func presentVC() {
        print("func start Present Btn in VC4")
        let navigationController = UINavigationController()
        let vc = ViewController5()
        navigationController.viewControllers = [vc]
        self.present(navigationController, animated: true, completion: nil)
    }
}
