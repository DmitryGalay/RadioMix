
//
//  UIColor+threedeers.swift
//  WhiteLabel
//
//  Created by JGRU on 10/16/18.
//  Copyright © 2018 threedeers. All rights reserved.
//

import UIKit


extension UIColor {
    
    convenience init(r: UInt8, g: UInt8, b: UInt8, alpha: Float = 1.0) {
        let divider: Float = 255.0
        self.init(red: CGFloat(Float(r)/divider), green: CGFloat(g)/CGFloat(divider), blue: CGFloat(b)/CGFloat(divider), alpha: CGFloat(alpha))
    }
    
    private convenience init(rgbWithoutValidation value: Int32, alpha: CGFloat = 1.0) {
        self.init(
            r: UInt8((value & 0xFF0000) >> 16),
            g: UInt8((value & 0x00FF00) >> 8),
            b: UInt8(value & 0x0000FF),
            alpha: Float(alpha)
        )
    }
    
    convenience init?(rgb: Int32, alpha: CGFloat = 1.0) {
        if rgb > 0xFFFFFF || rgb < 0 {
            return nil
        }
        self.init(rgbWithoutValidation: rgb, alpha: alpha)
    }
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        var charSet = CharacterSet.whitespacesAndNewlines
        charSet.insert("#")
        let _hex = hex.trimmingCharacters(in: charSet)
        guard let range = _hex.range(of: "[0-9A-Fa-f]{6}", options: .regularExpression), _hex.count == _hex.distance(from: range.lowerBound, to: range.upperBound) else {
            return nil
        }
        var rgb: UInt32 = 0
        Scanner(string: _hex).scanHexInt32(&rgb)
        self.init(rgbWithoutValidation: Int32(rgb), alpha: alpha)
    }
    
/*
    // Creates a UIColor from a Hex string.
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(1)
        }
        
        if (countElements(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringToIndex(2)
        var gString = cString.substringFromIndex(2).substringToIndex(2)
        var bString = cString.substringFromIndex(4).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner.scannerWithString(rString).scanHexInt(&r)
        NSScanner.scannerWithString(gString).scanHexInt(&g)
        NSScanner.scannerWithString(bString).scanHexInt(&b)
        
        return UIColor(red: Float(r) / 255.0, green: Float(g) / 255.0, blue: Float(b) / 255.0, alpha: Float(1))
    }*/
    
    
}
