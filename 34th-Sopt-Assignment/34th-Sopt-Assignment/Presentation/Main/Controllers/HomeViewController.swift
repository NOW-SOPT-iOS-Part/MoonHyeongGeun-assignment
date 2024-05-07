//
//  HomeViewController.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/7/24.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Property
    private var data: [Program]?
    
    // MARK: - Component
    
    private lazy var mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewFlowLayout())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        bind(data: Program.main)
        setDelegate()
        }
    
    func bind(data: [Program]) {
        self.data = data
    }
    
    private func configureCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 498)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
    
    // MARK: - Set UI
    func setUI() {
        mainCollectionView.do{
            $0.backgroundColor = UIColor.black
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
        }
    }
    
    func setAutoLayout() {
        mainCollectionView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(498)
        }
    }
    
    func setViewHierarchy() {
        view.addSubview(mainCollectionView)
    }

    
    // MARK: Delegate
    func setDelegate() {
        mainCollectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let data else { return 0 }
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = data,
              let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "MainCollectionViewCell",
                for: indexPath
        ) as? MainCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.bind(data: data[indexPath.row])
        return cell
    }
}
