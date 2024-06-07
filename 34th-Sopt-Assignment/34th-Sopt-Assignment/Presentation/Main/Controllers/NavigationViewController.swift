import UIKit
import SnapKit
import Then

final class NavigationViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - Component
    
    private let segmentedControl = UISegmentedControl(items: ["홈", "실시간", "TV프로그램", "영화", "파라마운트"]).then {
        $0.backgroundColor = .clear
        $0.selectedSegmentIndex = 0
    }
    
    private let tvingLogo = UIImageView()
    
    private let profile = UIImageView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        view.backgroundColor = .black
        super.viewDidLoad()
        setUI()
        setViewHierarchy()
        setAutoLayout()
        }
    
    // MARK: - Set UI
    func setUI() {
        profile.do {
            let image = UIImage(named: "profile")
            $0.image = image
        }
        
        tvingLogo.do{
            let image = UIImage(named: "logo1")
            $0.image = image
        }
    }
    
    // MARK: - AutoLayout
    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        profile.snp.makeConstraints { make in
            make.width.height.equalTo(31)
            make.top.equalTo(safeArea).offset(55)
            make.trailing.equalToSuperview().offset(-8)
        }
        tvingLogo.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(25)
            make.top.equalTo(safeArea).offset(58)
            make.leading.equalToSuperview().offset(11)
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(tvingLogo, profile)
    }
    
    
    // MARK: - Action
    
    
    // MARK: - Extension
}



