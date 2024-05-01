import UIKit
import Then
import SnapKit

final class MustWatchCell: UICollectionViewCell, ReuseIdentifiable {
    // MARK: - UIComponent
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: configureCollectionViewFlowLayout()
    )
    
    // MARK: - Property
    
    private var data: [Program]?
    
    // MARK: - Identifier
    
    static let identifier = "MustWatchCellIdentifier"
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUI()
        setViewHierarchy()
        setAutoLayout()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: [Program]) {
        self.data = data
        pageControl.numberOfPages = data.count
    }
    
    private func configureCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: Screen.height(498))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}
