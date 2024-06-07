//
//  RecommendCollectionView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/7/24.
//

import UIKit

final class RecommendCollectionView: UICollectionView {
    
    private func setCollectionView() {
        self.backgroundColor = UIColor.black
        self.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        self.register(RecommendCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendCollectionHeaderView.identifier)
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: RecommendCollectionView.createFlowLayout())
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        collectionViewLayout = RecommendCollectionView.createFlowLayout()
        setCollectionView()
    }
    
    private static func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 96, height: 146)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = CGSize(width: 100, height: 50) //?
        return layout
    }
}
