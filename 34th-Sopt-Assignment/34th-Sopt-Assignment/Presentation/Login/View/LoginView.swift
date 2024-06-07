//
//  LoginView.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/3/24.
//

import UIKit

import Then
import SnapKit

final class LoginView: UIView {
    // MARK: - Component
    
    let makeNicknameButton = UIButton()
    
    let idTextFieldRightView = UIView()
    
    let pwTextFieldRightView = UIView()
    
    let titleLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = UIFont.pretendardFont(weight: 500, size: 23)
        $0.textColor = UIColor.gray84
        $0.textAlignment = .center
    }
    
    lazy var idTextField = UITextField().then {
        $0.backgroundColor = .gray4
        $0.textColor = .gray2
        $0.font = UIFont.pretendardFont(weight: 600, size: 15)
        $0.setPlaceholder(placeholder: "아이디", placeholderColor: .gray2, font: UIFont.pretendardFont(weight: 600, size: 15))
        $0.rightView = idTextFieldRightView
        $0.rightViewMode = .whileEditing
        $0.addPadding(left: 22)
        $0.setLayer(cornerRadius: 3)
    }
    
    let idClearButton = UIButton().then {
        $0.setImage(UIImage(named: "cancel"), for: .normal)
        $0.tag = 0
    }
    
    lazy var pwTextField = UITextField().then {
        $0.backgroundColor = .gray4
        $0.textColor = .gray2
        $0.font = UIFont.pretendardFont(weight: 600, size: 15)
        $0.setPlaceholder(placeholder: "비밀번호", placeholderColor: .gray2, font: UIFont.pretendardFont(weight: 600, size: 15))
        $0.rightView = pwTextFieldRightView
        $0.rightViewMode = .whileEditing
        $0.addPadding(left: 22)
        $0.setLayer(cornerRadius: 3)
    }
    
    let pwClearButton = UIButton().then {
        $0.setImage(UIImage(named: "cancel"), for: .normal)
        $0.tag = 1
    }
    
    let pwShowButton = UIButton().then {
        $0.setImage(UIImage(named: "eyeSlash"), for: .normal)
    }
    
    let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
        $0.backgroundColor = .black
        $0.setLayer(borderColor: .gray4, borderWidth: 1)
    }
    
    let findIdButton = UIButton().then {
        
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
    }
    
    let findPwButton = UIButton().then {
        
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
    }
    
    let helpButton = UIButton().then {
        
        $0.setTitle("아직 계정이 없으신가요?", for: .normal)
        $0.setTitleColor(.gray3, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set UI
    
    func setUI() {
        let safeArea = self.safeAreaLayoutGuide
        
        self.addSubviews(
            titleLabel,
            idTextField,
            pwTextField,
            loginButton,
            findIdButton,
            findPwButton,
            helpButton,
            makeNicknameButton
        )
        
        idTextFieldRightView.addSubviews(idClearButton)
        pwTextFieldRightView.addSubviews(pwShowButton, pwClearButton)
        
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeArea.snp.top).offset(50)
        }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(safeArea).inset(20)
            make.height.equalTo(50)
        }
        
        idTextFieldRightView.snp.makeConstraints {
            $0.width.equalTo(35)
            $0.height.equalTo(52)
        }
        
        idClearButton.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.leading.centerY.equalTo(idTextFieldRightView)
        }
        
        
        idTextFieldRightView.snp.makeConstraints { make in
            make.width.equalTo(35)
        }
        
        idClearButton.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(10)
            make.horizontalEdges.height.equalTo(idTextField)
        }
        
        pwTextFieldRightView.snp.makeConstraints {
            $0.width.equalTo(70)
            $0.height.equalTo(52)
        }
        
        pwShowButton.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.leading.centerY.equalTo(pwTextFieldRightView)
        }
        
        pwClearButton.snp.makeConstraints {
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(pwTextFieldRightView.snp.trailing).offset(-20)
            $0.centerY.equalTo(pwTextFieldRightView)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(20)
            make.horizontalEdges.height.equalTo(idTextField)
        }
        
        findIdButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.leading.equalTo(safeArea.snp.leading).offset(85)
            make.height.equalTo(22)
        }
        
        findPwButton.snp.makeConstraints { make in
            make.top.height.equalTo(findIdButton)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-85)
        }
        helpButton.snp.makeConstraints{ make in
            make.top.equalTo(findIdButton.snp.bottom).offset(30)
            make.leading.equalTo(safeArea.snp.leading).offset(51)
            make.height.equalTo(22)
        }
        makeNicknameButton.snp.makeConstraints{ make in
            make.top.equalTo(findPwButton.snp.bottom).offset(28)
            make.leading.equalTo(helpButton.snp.trailing).offset(33)
        }
    }
}
