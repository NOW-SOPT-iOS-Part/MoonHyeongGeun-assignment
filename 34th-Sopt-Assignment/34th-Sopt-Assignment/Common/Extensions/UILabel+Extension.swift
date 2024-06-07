import UIKit

extension UILabel {
    
    func underLineText(forText: String) {
        guard let labelText = self.text else { return }
        
        let rangeToUnderLine = (labelText as NSString).range(of: forText)
        
        let underLineText = NSMutableAttributedString(string: labelText)
        underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderLine)
        
        self.attributedText = underLineText
    }
        
    func setText(text: String, color: UIColor, font: UIFont?) {
        self.text = text
        self.textColor = color
        self.font = font
    }
}
