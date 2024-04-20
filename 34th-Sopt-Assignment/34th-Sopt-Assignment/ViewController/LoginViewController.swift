import SnapKit
import UIKit

class LoginViewController: UIViewController{
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
//        label.font = UIFont()
        label.textAlignment = .center
        return label
    }()
    
    private let idTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "아이디"
//        textField.font = UIFont()
        textField.backgroundColor = .grey1
        return textField
    }()
    
    private let passwordTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont()
        textField.backgroundColor = .grey1
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        return button
    }()
    
    private lazy var findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        return button
    }()
    
    private let createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
//        label.font = UIFont()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        setLayout()
    }
    
    private func setLayout(){
        [titleLabel, idTextField, passwordTextField, loginButton, findIdButton, findPasswordButton, createAccountLabel, createAccountButton].forEach {
            self.view.addSubview($0)
        }
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(90)
        }
        idTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(31)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        loginButton.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(21)
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(52)
        }
        findIdButton.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(85)
            make.height.equalTo(22)
        }
        findPasswordButton.snp.makeConstraints { make in
            make.top.height.equalTo(findIdButton)
            make.trailing.equalToSuperview().offset(-85)
        }
        createAccountLabel.snp.makeConstraints{ make in
            make.top.equalTo(findIdButton.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(51)
            make.height.equalTo(22)
        }
        createAccountButton.snp.makeConstraints{ make in
            make.top.height.equalTo(createAccountLabel)
            make.trailing.equalToSuperview().offset(-65)
        }
    }
}


//#Preview{
//    LoginViewController()
//}
