//
//  PresentView.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

final class PresentView: UIView {
    
    private lazy var presentView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.addSubview(presentBtn)
        return view
    }()
    
    lazy var presentBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Present", for: .normal)
        btn.addTarget(self, action: #selector(touchPushBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func touchPushBtn() {
        print("touch Present Btn")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        addSubview(presentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        
        presentView.translatesAutoresizingMaskIntoConstraints = false
        presentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        presentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        presentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        presentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        presentBtn.translatesAutoresizingMaskIntoConstraints = false
        presentBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        presentBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
