//
//  UITextField+threedeers.swift
//  WhiteLabel
//
//  Created by JGRU on 11/5/18.
//  Copyright © 2018 threedeers. All rights reserved.
//

import UIKit

extension UITextField
{
    func setBottomBorder(color:UIColor)
    {
        self.borderStyle = UITextField.BorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setTextView(textColor: UIColor,fontName:String,placeholderName: String,foregroundColor:UIColor,size: CGFloat,secure: Bool = false) {
        
        self.textColor = textColor
        self.font = UIFont(name:fontName, size: size)
        self.attributedPlaceholder = NSAttributedString(string: placeholderName ,  attributes: [NSAttributedString.Key.foregroundColor: foregroundColor])
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isSecureTextEntry = secure
    }
}
