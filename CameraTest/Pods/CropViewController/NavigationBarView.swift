//
//  NavigationBarView.swift
//  CameraTest
//
//  Created by 강조은 on 2023/05/21.
//

import UIKit

class NavigationBarView: UIView {
    @IBOutlet weak var btnBack: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    private func commonInit() {
//        let view = Bundle.main.loadNibNamed("NavigationBarView", owner: self, options: nil)!.first as! UIView
//
//        view.frame = self.bounds
//        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//
//        addSubview(view)
        
        let view = Bundle.main.loadNibNamed("NavigationBarView",
                                               owner: self,
                                               options: nil)?.first as! UIView
                view.frame = bounds
                addSubview(view)
    }
}