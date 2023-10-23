//
//  HomeVC.swift
//  Pagination
//
//  Created by 강조은 on 2023/10/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController, UITextFieldDelegate {
    
    let homeView = HomeView()
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        initTarget()
    }

    func initTarget() {
        homeView.searchBar.textfield.delegate = self
        
        homeView.searchBar.textfield.rx.text.orEmpty
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] text in
                guard let self else { return }
                requestApi(query: text)
            })
            .disposed(by: disposeBag)
    }
    
    func requestApi(query: String) {
        viewModel.requestSearchData(query: query) {
            self.homeView.collectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchDatas.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeView.collectionView.dequeueReusableCell(withReuseIdentifier: HomeCVCell.identifier, for: indexPath) as? HomeCVCell else { return UICollectionViewCell() }
        let urlString = viewModel.searchDatas[indexPath.row].imageURL
        cell.imageView.load(urlString: urlString)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow: CGFloat = 3
        let spacingBetweenItems: CGFloat = 15
        let totalSpacing = (numberOfItemsPerRow - 1) * spacingBetweenItems
        let availableWidth = homeView.collectionView.frame.width - totalSpacing
        let calculatedItemWidth = availableWidth / numberOfItemsPerRow
        return CGSize(width: calculatedItemWidth, height: calculatedItemWidth)
    }
}

extension HomeVC : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffset_y = scrollView.contentOffset.y
        let tableViewContentSize = homeView.collectionView.contentSize.height
        let pagination_y = tableViewContentSize * 0.2
        
        if contentOffset_y > tableViewContentSize - pagination_y {
            viewModel.requestSearchData(query: homeView.searchBar.textfield.text ?? "") {
                DispatchQueue.main.async {
                    self.homeView.collectionView.reloadData()
                }
            }
        }
    }
}
