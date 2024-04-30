import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    enum Section {
        case main([Program])
        case mustSee([Program])
        case mostViewed([Program])
    }
    
    // MARK: - UIComponent
    
    private let segmentedControl = UnderlineSegmentedControl(items: ["홈", "실시간", "프로그램", "영화", "파라마운트+"])
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: <#T##UICollectionViewLayout#>)
    private let liveView = UIView()
    private let tvProgramView = UIView()
    private let movieView = UIView()
    private let paramountView = UIView()
    
    // MARK: - Property
    
    private var segmentViews: [UIView] {
        [homeCollectionView, liveView, tvProgramView, movieView, paramountView]
    }
    
    private let mockData: [Section] = [
        .main(Program.main),
        .mostViewed(Program.mostViewed)
    ]
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
//        setDelegate()
    }
    // MARK: - Action
    @objc
    private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        for i in 0..<segmentViews.count {
            segmentViews[i].isHidden = i != sender.selectedSegmentIndex
        }
    }
}

// MARK: - UICollectionViewDataSource

// MARK: - UICollectionViewFlowLayout

private extension HomeViewController {
    func setCollectionViewLayout() -> UICollectionViewFlowLayout {
        return UICollectionViewFlowLayout { section, _ in
            switch self.mockData[section] {
            case .main:
                return self.setMainLayout()
            case .mostViewed:
                return self.setMostViewedLayout()
            case .recommend, .paramounts:
                return self.setImageAndTitleLayout()
            case .longLogo:
                return self.setLongLogoLayout()
            }
        }
    }
}


private extension HomeViewController {
    //MARK: - SetUI
    
    func setUI() {
        view.backgroundColor = .black
        
        segmentedControl.do {
            $0.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        }
        
        homeCollectionView.do {
            $0.backgroundColor = .black
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.contentInsetAdjustmentBehavior = .never
            $0.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(
            segmentedControl, homeCollectionView, liveView,
            tvProgramView, movieView, paramountView
        )
        view.bringSubviewToFront(segmentedControl)
    }
    
    // MARK: - AutoLayout

    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        segmentedControl.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeArea)
            $0.height.equalTo(40)
        }
        
        segmentViews.forEach { view in
            view.snp.makeConstraints {
                $0.top.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(safeArea)
            }
        }
    }

}



