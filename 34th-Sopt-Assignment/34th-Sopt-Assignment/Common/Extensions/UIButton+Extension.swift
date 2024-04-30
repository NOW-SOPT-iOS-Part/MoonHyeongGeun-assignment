import UIKit
import Foundation

extension UIButton {
    
    func setLayer(
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 0
    ) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
    
    func underlineTitle(forTitle: String) {
           guard let buttonTitle = self.titleLabel?.text else { return }
           
           let rangeToUnderLine = (buttonTitle as NSString).range(of: forTitle)
           
           let underLineTitle = NSMutableAttributedString(string: buttonTitle)
           underLineTitle.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
           
           self.setAttributedTitle(underLineTitle, for: .normal)
       }
}
