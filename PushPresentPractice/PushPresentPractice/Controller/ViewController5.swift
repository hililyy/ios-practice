//
//  ViewController5.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ViewController5: UIViewController {
    
    private let contentsView = ContentsView()
    
    override func loadView() {
        view = contentsView
        view.backgroundColor = .purple
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
        sendNotification()
    }
    
    @objc func tapPresentBtn() {
        sendNotification()
    }
    
    func sendNotification() {
        print("send Notification in VC5")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushToNextView"), object: nil)
    }
}
