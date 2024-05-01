import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    enum Section {
        case main(
            [Program]
        )
    }
    
    // MARK: - UIComponent
    
    private let segmentedControl = UnderlineSegmentedControl(
        items: [
            "홈",
            "실시간",
            "프로그램",
            "영화",
            "파라마운트+"
        ]
    )
    private lazy var homeCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let liveView = UIView(
        backgroundColor: .gray4
    )
    private let tvProgramView = UIView(
        backgroundColor: UIColor.gray3
    )
    private let movieView = UIView(
        backgroundColor: UIColor.gray2
    )
    private let paramountView = UIView(
        backgroundColor: UIColor.gray1
    )
    
    // MARK: - Property
    
    private var segmentViews: [UIView] {
        [
            homeCollectionView,
            liveView,
            tvProgramView,
            movieView,
            paramountView
        ]
    }
    
    private let mockData: [Section] = [
        .main(
            Program.main
        )
    ]
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        setDelegate()
    }
    // MARK: - Action
    @objc
    private func segmentedControlValueChanged(
        _ sender: UISegmentedControl
    ) {
        for i in 0..<segmentViews.count {
            segmentViews[i].isHidden = i != sender.selectedSegmentIndex
        }
    }
}

private extension HomeViewController {
    //MARK: - SetUI
    
    func setUI() {
        view.backgroundColor = .black
        
        segmentedControl.do {
            $0.addTarget(
                self,
                action: #selector(
                    segmentedControlValueChanged
                ),
                for: .valueChanged
            )
        }
        
        homeCollectionView.do {
            $0.backgroundColor = UIColor.black
            $0.showsHorizontalScrollIndicator = false
            $0.showsVerticalScrollIndicator = false
            $0.register(
                MainCell.self,
                forCellWithReuseIdentifier: "MainCellIdentifier"
            )
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(
            segmentedControl,
            homeCollectionView,
            liveView,
            tvProgramView,
            movieView,
            paramountView
        )
        view.bringSubviewToFront(
            segmentedControl
        )
    }
    
    // MARK: - AutoLayout
    
    func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        segmentedControl.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(
                safeArea
            )
            $0.height.equalTo(
                40
            )
        }
        
        segmentViews.forEach { view in
            view.snp.makeConstraints {
                $0.top.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(
                    safeArea
                )
            }
        }
    }
    // MARK: - Delegate
    func setDelegate() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource{
    
    func numberOfSections(
        in collectionView: UICollectionView
    ) -> Int {
        return mockData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        switch mockData[section] {
        case .main(
            let programs
        ):
            return programs.count
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let section = mockData[indexPath.section]
        switch section {
        case .main(
            let programs
        ):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MainCell.identifier,
                for: indexPath
            ) as? MainCell else {
                fatalError(
                    "Unable to dequeue MainCell"
                )
            }
            cell.bind(
                data: programs
            )
            return cell
        }
    }
    
}
// MARK: - UICollectionViewFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(
            width: screenWidth,
            height: 498
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
    }
}




