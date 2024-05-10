import UIKit

class TopCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TopCollectionViewCell"
    private var program: Program?
    
    private let mainPoster = UIImageView()
    
    func setUI() {
        mainPoster.do{
            $0.contentMode = .scaleAspectFill
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        addSubview(mainPoster)
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
