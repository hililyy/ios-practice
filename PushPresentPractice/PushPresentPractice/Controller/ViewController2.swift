//
//  ViewController2.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController2: UIViewController {
    
    private let contentsView = ContentsView()
    
    override func loadView() {
        view = contentsView
        view.backgroundColor = .yellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
        setNotification()
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
    
    func setNotification() {
        print("set notification in VC2")
        NotificationCenter.default.addObserver(self, selector: #selector(pushVC), name: NSNotification.Name(rawValue: "pushToNextView"), object: nil)
    }
}

extension ViewController2: ViewProtocol {
    
    @objc public func pushVC() {
        print("func start Push Btn in VC2")
        let vc = ViewController3()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    public func presentVC() {
        print("func start Present Btn in VC2")
        let navigationController = UINavigationController()
        let vc = ViewController3()
        navigationController.viewControllers = [vc]
        self.present(navigationController, animated: true, completion: nil)
    }
}
