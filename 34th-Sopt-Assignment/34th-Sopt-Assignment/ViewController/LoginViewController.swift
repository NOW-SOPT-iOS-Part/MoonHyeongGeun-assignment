import Then
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let titleLabel = UILabel()
    private let idTextField = UITextField()
    private let idTextFieldRightView = UIView()
    private let idClearButton = UIButton()
    private let pwTextField = UITextField()
    private let pwTextFieldRightView = UIView()
    private let pwClearButton = UIButton()
    private let pwShowButton = UIButton()
    private let loginButton = UIButton()
    private let findIdButton = UIButton()
    private let findPwButton = UIButton()
    private let helpButton = UIButton()
    private let makeNicknameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }
    
    // MARK: - Action
    
    @objc private func textFieldClearButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            idTextField.text = ""
        case 1:
            pwTextField.text = ""
        default:
            break
        }
    }
    
    @objc private func pwShowButtonTapped(_ sender: UIButton) {
        pwTextField.isSecureTextEntry.toggle()
        let image = UIImage(named: pwTextField.isSecureTextEntry ? "eyeSlash" : "eye1") // 수정: UIImage(resource:)를 UIImage(named:)로 변경
        sender.setImage(image, for: .normal)
    }
    
    @objc private func loginButtonTapped() {
    }
    
//    private func setDelegate() { 추가: setDelegate 함수 정의 필요
//        idTextField.delegate = self
//        pwTextField.delegate = self
//    }
    
    // MARK: - SetUI
    
    private func setUI() {
        
        view.backgroundColor = .black
        
        titleLabel.do {
            $0.text = "TVING ID 로그인"
            $0.font = UIFont.pretendardFont(weight: 500, size: 23)
            $0.textColor = UIColor.gray84
            $0.textAlignment = .center
        }
        
        idTextField.do {
            $0.backgroundColor = .gray4
            $0.textColor = .gray2
            $0.font = UIFont.pretendardFont(weight: 600, size: 15)
            $0.setPlaceholder(placeholder: "아이디", placeholderColor: .gray2, font: UIFont.pretendardFont(weight: 600, size: 15))
            $0.rightView = idTextFieldRightView
            $0.rightViewMode = .whileEditing
            $0.addPadding(left: 22)
            $0.setLayer(cornerRadius: 3)
        }
        
        pwTextField.do {
            $0.backgroundColor = .gray4
            $0.textColor = .gray2
            $0.font = UIFont.pretendardFont(weight: 600, size: 15)
            $0.setPlaceholder(placeholder: "비밀번호", placeholderColor: .gray2, font: UIFont.pretendardFont(weight: 600, size: 15))
            $0.rightView = pwTextFieldRightView
            $0.rightViewMode = .whileEditing
            $0.addPadding(left: 22)
            $0.setLayer(cornerRadius: 3)
        }
        
        idClearButton.do {
            $0.setImage(UIImage(named: "cancel"), for: .normal)
            $0.addTarget(self, action: #selector(textFieldClearButtonTapped(_:)), for: .touchUpInside)
            $0.tag = 0
        }
        
        pwShowButton.do {
            $0.setImage(UIImage(named: "eyeSlash"), for: .normal)
            $0.addTarget(self, action: #selector(pwShowButtonTapped(_:)), for: .touchUpInside)
        }
        
        pwClearButton.do {
            $0.setImage(UIImage(named: "cancel"), for: .normal)
            $0.addTarget(self, action: #selector(textFieldClearButtonTapped(_:)), for: .touchUpInside)
            $0.tag = 1
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
            $0.isEnabled = false
            $0.backgroundColor = .black
            $0.setLayer(borderColor: .gray4, borderWidth: 1)
            $0.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        }
        
        findIdButton.do {
            $0.setTitle("아이디 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
        }
        
        findPwButton.do {
            $0.setTitle("비밀번호 찾기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
        }
        
        helpButton.do{
            $0.setTitle("아직 계정이 없으신가요?", for: .normal)
            $0.setTitleColor(.gray3, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
        }
        
        makeNicknameButton.do{
            $0.setTitle("닉네임 만들러가기", for: .normal)
            $0.setTitleColor(.gray2, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 400, size: 14)
            $0.underlineTitle(forTitle: "닉네임 만들러가기")
        }
    }
    
    private func setViewHierarchy() {
        view.addSubviews(
                    titleLabel, idTextField, pwTextField, loginButton, findIdButton, findPwButton, helpButton, makeNicknameButton
                )
        
        idTextFieldRightView.addSubviews(idClearButton)
        pwTextFieldRightView.addSubviews(pwShowButton, pwClearButton)
    }
    
    // MARK: - AutoLayout
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
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
