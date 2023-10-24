//
//  Extension.swift
//  Pagination
//
//  Created by 강조은 on 2023/10/23.
//

import UIKit
import Kingfisher

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

extension UIImageView {
    func setImage(urlString: String) {
        ImageCache.default.retrieveImage(forKey: urlString, options: nil) { result in
            switch result {
            case .success(let value):
                if let image = value.image {
                    //캐시가 존재하는 경우
                    self.image = image
                } else {
                    //캐시가 존재하지 않는 경우
                    guard let url = URL(string: urlString) else { return }
                    self.kf.setImage(with: url)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
