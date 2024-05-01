import Foundation
import UIKit


extension UIView {
    func addSubviews(
        _ views: UIView...
    ) {
        views.forEach {
            self.addSubview(
                $0
            )
        }
    }
    
    convenience init(
        backgroundColor: UIColor
    ) {
            self.init()
            self.backgroundColor = backgroundColor
        }
    }
