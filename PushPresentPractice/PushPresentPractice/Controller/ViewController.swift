//
//  ViewController.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

final class ViewController: UIViewController {

    private let contentsView = ContentsView()
    
    override func loadView() {
        view = contentsView
        view.backgroundColor = .systemRed
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

extension ViewController: ViewProtocol {
    
    public func pushVC() {
        print("func start Push Btn in VC1")
        let vc = ViewController2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func presentVC() {
        print("func start Push Btn in VC1")
        let navigationController = UINavigationController()
        let vc = ViewController2()
        navigationController.viewControllers = [vc]
        self.present(navigationController, animated: true, completion: nil)
    }
}
