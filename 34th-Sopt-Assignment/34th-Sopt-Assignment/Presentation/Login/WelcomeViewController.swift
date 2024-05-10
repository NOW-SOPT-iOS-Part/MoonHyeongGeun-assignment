import Then
import UIKit
import SnapKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Component
    
    private let logoImageView = UIImageView()
    
    private let welcomeLabel = UILabel()
    
    private let mainButton = UIButton()
    
    // MARK: - Property
    
    private let id: String
    
    private let nickname: String?
    
    // MARK: - Initializer
    
    init(id: String, nickname: String?) {
        self.id = "id"
        self.nickname = "nickname"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }
    
    // MARK: - Action
    
    @objc
    private func mainButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

private extension WelcomeViewController {
    
    // MARK: - SetUI
    
    func setUI() {
        view.backgroundColor = .black
        navigationItem.hidesBackButton = true
        
        logoImageView.do {
            $0.image = UIImage(resource: .logo1)
            $0.contentMode = .scaleAspectFill
        }
        
        welcomeLabel.do {
            $0.setText(
                """
                \(nickname ?? id)님
                반가워요!
                """,
                color: .white,
                font: .pretendardFont(weight: 700, size: 23)
            )
            $0.textAlignment = .center
            $0.numberOfLines = 3
        }
        
        mainButton.do {
            $0.setTitle("메인으로", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.pretendardFont(weight: 600, size: 14)
            $0.backgroundColor = .red
            $0.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(logoImageView, welcomeLabel, mainButton)
    }
    
    // MARK: - AutoLayout
    
    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
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
