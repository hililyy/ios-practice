//
//  PushView.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class PushView: UIView {
    
    private lazy var pushView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        view.addSubview(pushBtn)
        return view
    }()
    
    lazy var pushBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Push", for: .normal)
        btn.addTarget(self, action: #selector(touchPushBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func touchPushBtn() {
        print("tap push button in UIView")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pushView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        pushView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pushView.topAnchor.constraint(equalTo: topAnchor),
            pushView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pushView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pushView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        pushBtn.translatesAutoresizingMaskIntoConstraints = false
        pushBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        pushBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
