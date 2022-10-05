//
//  UILabel+threedeers.swift
//  WhiteLabel
//
//  Copyright © 2022 threedeers. All rights reserved.
//

import Foundation

extension UILabel {
    
    func addCharacterSpacing(kernValue: Double = 1.15) {
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
    
    func setLabel(text: String, textColor: UIColor, fontName: String, size: CGFloat ) {
        self.lineBreakMode = .byWordWrapping
        self.numberOfLines = 0
        self.text = text
        self.textColor = textColor
        self.font = UIFont(name:fontName, size: size)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
