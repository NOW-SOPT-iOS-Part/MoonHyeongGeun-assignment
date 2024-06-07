import Foundation
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Property
    
    private var sectionsData: [SectionType: [Program]] = [:]
    
    private var sections: [SectionType] = [.main, .recommended]
    
    private let rootView = HomeView()
    
    enum SectionType {
        case main
        case recommended
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        bind(data: Program.main, for: .main)
        bind(data: Program.mustSee, for: .recommended)
        setDelegate()
    }
    
    // MARK: - Action
    
    func bind(data: [Program], for section: SectionType) {
        sectionsData[section] = data
    }

    
    // MARK: - Delegate
    
    func setDelegate() {
        rootView.topCollectionView.dataSource = self
        rootView.recommendCollectionView.dataSource = self
    }

}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = collectionView == rootView.topCollectionView ? SectionType.main : SectionType.recommended
        return sectionsData[sectionType]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = collectionView == rootView.topCollectionView ? SectionType.main : SectionType.recommended
        
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader && collectionView == rootView.recommendCollectionView {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendCollectionHeaderView.identifier, for: indexPath) as? RecommendCollectionHeaderView else {
                    fatalError("Could not find proper header")
                }

                header.configure(with: "티빙이 추천하는 콘텐츠")
                return header
            }
            return UICollectionReusableView()
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            if collectionView == rootView.recommendCollectionView {
                return CGSize(width: collectionView.bounds.width, height: 50) // 헤더의 높이 설정
            }
            return CGSize.zero
        }
}
