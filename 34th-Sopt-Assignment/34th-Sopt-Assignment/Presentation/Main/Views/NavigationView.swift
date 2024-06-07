//
//  NavigationView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/7/24.
//

import UIKit

import SnapKit

final class NavigationView: UIView {
    // MARK: - Component
    
    var segmentedControl = UISegmentedControl(items: ["홈", "실시간", "TV프로그램", "영화", "파라마운트"]).then {
        $0.backgroundColor = .clear
        $0.selectedSegmentIndex = 0
    }
    
    private let tvingLogo = UIImageView().then {
        $0.image = UIImage(named: "logo3")
    }
    
    private let profile = UIImageView().then {
        $0.image = UIImage(named: "profile")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .clear
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
        setUI()
    }
    
    // MARK: - Set UI
    
    func setUI() {
        self.addSubviews(segmentedControl, tvingLogo, profile)
        
        tvingLogo.snp.makeConstraints {
            $0.top.equalToSuperview().offset(58)
            $0.leading.equalToSuperview().offset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(tvingLogo.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
