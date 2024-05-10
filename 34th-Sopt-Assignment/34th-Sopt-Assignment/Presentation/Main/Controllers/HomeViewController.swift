import Foundation
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Property
    private var sectionsData: [SectionType: [Program]] = [:]
    private var sections: [SectionType] = [.main, .recommended]
    
    enum SectionType {
        case main
        case recommended
    }

    // MARK: - Component
    
    private lazy var topCollectionView = UICollectionView(frame: .zero, collectionViewLayout: TopCollectionViewFlowLayout())
    
    private lazy var recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: RecommendCollectionViewFlowLayout())
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        bind(data: Program.main, for: .main)
        bind(data: Program.mustSee, for: .recommended)
        setDelegate()
    }
    
    func bind(data: [Program], for section: SectionType) {
        sectionsData[section] = data
    }
    
    private func TopCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 498)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
    
    private func RecommendCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 96, height: 146)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.headerReferenceSize = CGSize(width: 100, height: 50) //?
        return layout
    }
    
    // MARK: - Set UI
    
    func setUI() {
        topCollectionView.do{
            $0.backgroundColor = UIColor.black
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.register(TopCollectionViewCell.self, forCellWithReuseIdentifier: TopCollectionViewCell.identifier)
        }
        recommendCollectionView.do{
            $0.backgroundColor = UIColor.black
            $0.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
            $0.register(RecommendCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendCollectionHeaderView.identifier)
        }
    }
    
    func setAutoLayout() {
        topCollectionView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(498)
        }
        recommendCollectionView.snp.makeConstraints{
            $0.top.equalTo(topCollectionView.snp.bottom).offset(43)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(183)
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(topCollectionView, recommendCollectionView)
    }

    
    // MARK: Delegate
    func setDelegate() {
        topCollectionView.dataSource = self
        recommendCollectionView.dataSource = self
    }

}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = collectionView == topCollectionView ? SectionType.main : SectionType.recommended
        return sectionsData[sectionType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = collectionView == topCollectionView ? SectionType.main : SectionType.recommended
        
        switch sectionType {
        case .main:
            guard let data = sectionsData[.main], let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TopCollectionViewCell.identifier,
                for: indexPath
            ) as? TopCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.bind(data: data[indexPath.row])
            return cell
        case .recommended:
            guard let data = sectionsData[.recommended], let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendCollectionViewCell.identifier,
                for: indexPath
            ) as? RecommendCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.bind(data: data[indexPath.row])
            return cell
        }
    }
    
    // 헤더 설정
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader && collectionView == recommendCollectionView {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeaderView.identifier, for: indexPath) as? RecommendCollectionHeaderView else {
                    fatalError("Could not find proper header")
                }

                header.configure(with: "티빙이 추천하는 콘텐츠")
                return header
            }
            return UICollectionReusableView()
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            if collectionView == recommendCollectionView {
                return CGSize(width: collectionView.bounds.width, height: 50) // 헤더의 높이 설정
            }
            return CGSize.zero
        }
}
