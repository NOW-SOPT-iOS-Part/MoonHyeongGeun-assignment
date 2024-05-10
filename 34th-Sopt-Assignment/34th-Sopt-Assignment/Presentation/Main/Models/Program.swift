import UIKit

struct Program {
    var image: UIImage?
    var title: String?
    var rank: Int?
    var channel: String?
    var rating: Float?
}

extension Program {
    static var main: [Self] {
        [Program(image: .poster0),
         Program(image: .poster0),
         Program(image: .poster0),
         Program(image: .poster0),
         Program(image: .poster0)]
    }
    
    static var mustSee: [Self] {
        [Program(image: .poster1, title: "너의 이름은"),
         Program(image: .poster1, title: "시그널"),
         Program(image: .poster1, title: "해리포터"),
         Program(image: .poster1, title: "반지의 제왕"),
         Program(image: .poster1, title: "스즈메의 문단속")]
    }
    
    static var paramounts: [Self] {
        [Program(image: .poster1, title: "너의 이름은"),
         Program(image: .poster1, title: "시그널"),
         Program(image: .poster1, title: "해리포터"),
         Program(image: .poster1, title: "반지의 제왕"),
         Program(image: .poster1, title: "스즈메의 문단속")]
    }
    
    static var mostViewed: [Self] {
        [Program(image: .poster1, title: "너의 이름은", rank: 1, channel: "OCN", rating: 18.7),
         Program(image: .poster1, title: "시그널", rank: 2, channel: "tvn", rating: 18.7),
         Program(image: .poster1, title: "해리포터", rank: 3, channel: "OCN", rating: 18.7),
         Program(image: .poster1, title: "반지의 제왕", rank: 4, channel: "OCN", rating: 18.7),
         Program(image: .poster1, title: "스즈메의 문단속", rank: 5, channel: "OCN", rating: 18.7)]
    }
    
    static var longLogo: [Self] {
        [Program(image: .doosanLogo),
         Program(image: .doosanLogo),
         Program(image: .doosanLogo),
         Program(image: .doosanLogo),
         Program(image: .doosanLogo),
         Program(image: .doosanLogo)]
    }
}
