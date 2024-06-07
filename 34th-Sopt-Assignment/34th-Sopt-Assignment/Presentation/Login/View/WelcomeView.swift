//
//  WelcomeView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/3/24.
//

import UIKit

import SnapKit

final class WelcomeView: UIView {
    
    let logoImageView = UIImageView().then {
        $0.image = UIImage(resource: .logo1)
        $0.contentMode = .scaleAspectFill
    }
    
    let welcomeLabel = UILabel().then {
        $0.setText(
            text: "님 반가워요!",
            color: .white,
            font: .pretendardFont(weight: 700, size: 23)
        )
        $0.textAlignment = .center
        $0.numberOfLines = 3
    }
    
    let mainButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
        $0.backgroundColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setLayout() {
        self.addSubviews(logoImageView, welcomeLabel, mainButton)
        
        let safeArea = self.safeAreaLayoutGuide
        
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(67)
            $0.leading.trailing.equalToSuperview().inset(65)
        }
        
        mainButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(safeArea.snp.bottom).offset(-65)
            $0.height.equalTo(52)
        }
    }

}

