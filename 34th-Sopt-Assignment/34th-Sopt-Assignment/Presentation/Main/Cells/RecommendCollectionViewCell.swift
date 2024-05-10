import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecommendCollectionViewCell"
    private var program: Program?
    
    private let recommendPoster = UIImageView()
//    private let recommendTitle = UILabel()
//    private let viewAllButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setViewHierarchy()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(data: Program) {
        self.program = data
        recommendPoster.image = data.image
    }
    
    
    func setUI() {
        recommendPoster.do {
            $0.contentMode = .scaleAspectFill
        }
//        recommendTitle.do {
//            $0.text = "티빙에서 꼭 봐야하는 콘텐츠"
//            $0.font = UIFont.pretendardFont(weight: 600, size: 15)
//            $0.textColor = UIColor.white
//            $0.textAlignment = .left
//        }
//        viewAllButton.do {
//            $0.setTitle(title: "전체보기", titleColor: .gray3, font: .pretendardFont(weight: 500, size: 11))
//        }
    }
    
    func setAutoLayout() {
//        recommendTitle.snp.makeConstraints{
//            $0.top.equalToSuperview()
//            $0.left.equalToSuperview()
//        }
        recommendPoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setViewHierarchy() {
        self.addSubview(recommendPoster)
    }
    
}
