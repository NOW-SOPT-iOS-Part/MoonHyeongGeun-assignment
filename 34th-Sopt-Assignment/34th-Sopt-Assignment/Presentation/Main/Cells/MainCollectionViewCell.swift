//
//  HomeCollectionViewCell.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/8/24.
//

import UIKit



class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    private var program: Program?
    
    private let mainPoster = UIImageView()
    
    func setUI() {
        mainPoster.do{
            $0.contentMode = .scaleAspectFill
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainPoster)
        mainPoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: Program) {
        self.program = data
        mainPoster.image = data.image
    }
}
