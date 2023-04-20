//
//  ContentsView2.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

class ContentsView2: UIView {
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.addSubview(stackView)
        return view
    }()
    
    lazy var pushBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Push", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    lazy var presentBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Present", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.layer.cornerRadius = 15
        return btn
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [pushBtn, presentBtn])
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentsView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        pushBtn.translatesAutoresizingMaskIntoConstraints = false
        presentBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
