import Then
import UIKit
import SnapKit

protocol idDelegate: AnyObject {
    func bindUserId(id: String)
}

class LoginViewController: UIViewController {
    // MARK: - Property
    
    var delegate: idDelegate?
    
    private let rootView = LoginView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setTarget()
    }
    
    // MARK: - Action
    
    func setTarget() {
        rootView.idClearButton.addTarget(self, action: #selector(textFieldClearButtonTapped), for: .touchUpInside)
        rootView.pwClearButton.addTarget(self, action: #selector(textFieldClearButtonTapped), for: .touchUpInside)
        rootView.pwShowButton.addTarget(self, action: #selector(pwShowButtonTapped), for: .touchUpInside)
        rootView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        print("setTarget Clicked")
    }
    
    @objc private func textFieldClearButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            rootView.idTextField.text = ""
        case 1:
            rootView.pwTextField.text = ""
        default:
            break
        }
    }
    
    @objc private func pwShowButtonTapped(_ sender: UIButton) {
        rootView.pwTextField.isSecureTextEntry.toggle()
        let image = UIImage(named: rootView.pwTextField.isSecureTextEntry ? "eyeSlash" : "eye1") // 수정: UIImage(resource:)를 UIImage(named:)로 변경
        sender.setImage(image, for: .normal)
    }
    
    @objc private func loginButtonTapped() {
        let vc = WelcomeViewController()
        navigationController?.pushViewController(vc, animated: false)
        vc.bindUserId(id: rootView.idTextField.text ?? "")
    }
}
