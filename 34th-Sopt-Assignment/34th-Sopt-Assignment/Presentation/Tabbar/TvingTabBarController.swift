import Then
import UIKit

final class TvingTabBarController: UITabBarController{
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - SetUI
    private func setUI() {
        tabBar.do{
            $0.backgroundColor = .black
            $0.unselectedItemTintColor = .gray3
            $0.tintColor = .white
            $0.barTintColor = .black
        }
        
        let tabBarItems: [(title: String, image: UIImage?, tag: Int)] = [
        ("홈", )]
        
    }
    
}
