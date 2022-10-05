//
//  UIButton+threedeers.swift
//  WhiteLabel
//
//  Created by Dima on 17.06.22.
//  Copyright © 2022 threedeers. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setButton(backgroundColor: UIColor,
                   alignment:UIControl.ContentHorizontalAlignment = .left,
                   title: String,
                   fontName: String,
                   titleColor: UIColor,
                   tintColor: UIColor,
                   size: CGFloat) {
        
        self.backgroundColor = backgroundColor
        self.contentHorizontalAlignment = alignment
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont(name:fontName, size: size)
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = tintColor
    }
}
