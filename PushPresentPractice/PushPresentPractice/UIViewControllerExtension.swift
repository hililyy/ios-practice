//
//  UIViewControllerExtension.swift
//  PushPresentPractice
//
//  Created by 강조은 on 2023/04/20.
//

import UIKit

extension UIViewController {
    /**
     - note: push
     - parameters:
        - name: 스토리보드 이름
        - identifier: 뷰 컨트롤러 id
     */
    public func pushViewController(name: String, identifier: String, callback: ((UIViewController)->())? = nil) {
        
        if let nvc = self.navigationController {
            
            if !(nvc.topViewController?.description.contains(identifier))! {
                let storyBoard:UIStoryboard = UIStoryboard(name: name, bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: identifier)
                vc.modalTransitionStyle = .crossDissolve
                callback?(vc)
                nvc.pushViewController(vc, animated: true)
            }
        }
    }
    
    /**
     - note:present
     - parameters:
        - name: 스토리보드 이름
        - identifier: 뷰 컨트롤러 id
     */
    public func presentViewController(name: String, identifier: String, callback: ((UIViewController) -> ())? = nil, complete: (() -> ())? = nil) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        let nv = UINavigationController(rootViewController: vc)
        nv.isNavigationBarHidden = true
        nv.modalPresentationStyle = .overCurrentContext
        callback?(vc)
        
        self.present(nv, animated: true) {
            complete?()
        }
    }
}
