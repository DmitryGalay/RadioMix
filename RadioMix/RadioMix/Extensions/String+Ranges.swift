//
//  String+Ranges.swift
//  WhiteLabel
//
//  Created by Yan Khamutouski on 22.06.22.
//  Copyright © 2022 threedeers. All rights reserved.
//

import Foundation

public extension String {
    enum ValidType {
        case name
        case password
        case email
        case numbers
        case lowercasedCharacters
        case uppercasedCharacters
        case specialCharacters
    }
    
    enum Regex: String {
        case name = "[a-zA-Z ]{1,}"
        case numbers = "\\d"
        case lowercasedCharacters = "[a-z]"
        case uppercasedCharacters = "[A-Z]"
        case specialCharacters = "\\W"
        case password = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*\\W).{5,}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch validType {
        case.name: regex = Regex.name.rawValue
        case .email: regex = Regex.email.rawValue
        case .password: regex = Regex.password.rawValue
        case .numbers: regex = Regex.email.rawValue
        case .lowercasedCharacters: regex = Regex.email.rawValue
        case .uppercasedCharacters: regex = Regex.email.rawValue
        case .specialCharacters: regex = Regex.email.rawValue
        }

        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    func isValidPassword() -> [Bool] {
        let range = NSRange(location: 0, length: self.utf16.count)
        let numbers = try! NSRegularExpression(pattern: Regex.numbers.rawValue).firstMatch(in: self, options: [], range: range) != nil
        let lowercased = try! NSRegularExpression(pattern: Regex.lowercasedCharacters.rawValue).firstMatch(in: self, options: [], range: range) != nil
        let uppercased = try! NSRegularExpression(pattern: Regex.uppercasedCharacters.rawValue).firstMatch(in: self, options: [], range: range) != nil
        let special = try! NSRegularExpression(pattern: Regex.specialCharacters.rawValue).firstMatch(in: self, options: [], range: range) != nil
        
        return [numbers, lowercased, uppercased, special]
    }
    
    func range(ofText text: String) -> NSRange {
        let fullText = self
        let range = (fullText as NSString).range(of: text)
        return range
    }
}
