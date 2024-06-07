import Then
import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    
    private let id: String = ""
    private let rootView = WelcomeView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTarget()
        setDelegate()
    }
    
    // MARK: - Action
    
    func setUI() {
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
    }
    
    func setTarget() {
        rootView.mainButton.addTarget(
            self,
            action: #selector(mainButtonTapped),
            for: .touchUpInside
        )
    }
    
    func setDelegate() {
        let loginVc = LoginViewController()
        loginVc.delegate = self
    }
    
    @objc
    private func mainButtonTapped() {
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: false)
    }
}

extension WelcomeViewController: idDelegate {
    func bindUserId(id: String) {
        rootView.welcomeLabel.text = "\(id) 님 반갑습니다."
    }
}
