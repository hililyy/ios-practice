//
//  HomeViewModel.swift
//  Pagination
//
//  Created by 강조은 on 2023/10/23.
//

import Foundation
import Moya
import RxSwift
import RxRelay

class HomeViewModel {
    
//    var searchDatas = BehaviorRelay<[SearchModel]>(value: [])
    var searchDatas: [Document] = []
    var count = 1
    
    func requestSearchData(query: String, completion: @escaping () -> ()) {
        let provider = MoyaProvider<SearchAPI>()
        provider.request(.searchImage(query: query, page: count, size: 20)) { result in
            
            switch result {
            case let .success(response):
                let result = try? response.map(SearchModel.self)
                if let result {
                    let docu = result.documents
                    self.searchDatas.append(contentsOf: docu)
                    self.count += 1
                    completion()
                }
                
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
