import UIKit

class RecommendCollectionHeaderView: UICollectionReusableView {
    static let identifier = "RecommendCollectionHeaderViewIdentifier"

    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        addSubview(titleLabel)
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        titleLabel.do{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setAutoLayout(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
    }
    
    func configure(with text: String) {
        titleLabel.setText(text, color: UIColor.white, font: UIFont.pretendardFont(weight: 600, size: 15))
    }
}
