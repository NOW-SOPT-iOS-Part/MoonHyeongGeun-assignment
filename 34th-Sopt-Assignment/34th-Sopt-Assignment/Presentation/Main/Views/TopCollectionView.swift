//
//  topCollectionView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/3/24.
//

import UIKit

final class TopCollectionView: UICollectionView {
    
    private func setCollectionView() {
        self.backgroundColor = UIColor.black
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.identifier)
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: TopCollectionView.createFlowLayout())
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        collectionViewLayout = TopCollectionView.createFlowLayout()
        setCollectionView()
    }
    
    private static func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 498)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}
