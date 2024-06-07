import UIKit

import Then
import SnapKit

class TopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopCollectionViewCell"
    private var program: Program?
    
    private let mainPoster = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainPoster)
        setUI()
    }
    
    private func setUI() {
        mainPoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: Program) {
        self.program = data
        mainPoster.image = data.image
    }
}
