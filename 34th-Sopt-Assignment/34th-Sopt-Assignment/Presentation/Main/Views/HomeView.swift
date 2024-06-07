//
//  HomeView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/3/24.
//

import UIKit

final class HomeView: UIView {
    
    // MARK: - Component
    
    let topCollectionView = TopCollectionView()
    let recommendCollectionView = RecommendCollectionView()
    let navigationView = NavigationView()
    
    let homeView = UIView()
    let liveView = UIView()
    let tvProgramView = UIView()
    let movieView = UIView()
    let paramountView = UIView()

    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    func setUI() {
        self.addSubviews(
            topCollectionView,
            recommendCollectionView,
            navigationView,
            homeView,
            liveView,
            tvProgramView,
            movieView,
            paramountView
        )
        
        topCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(498)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(topCollectionView.snp.bottom).offset(43)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(183)
        }
        
        navigationView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(125)
        }
        
        let views = [homeView, liveView, tvProgramView, movieView, paramountView]
        views.forEach { view in
            view.snp.makeConstraints {
                $0.top.equalTo(navigationView.snp.bottom)
                $0.leading.trailing.bottom.equalToSuperview()
            }
            view.isHidden = true
        }
    }
}
