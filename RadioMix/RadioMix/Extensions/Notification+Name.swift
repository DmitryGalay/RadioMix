//
//  Notification+Name.swift
//  WhiteLabel
//
//  Created by Yan Khamutouski on 24.06.22.
//  Copyright © 2022 threedeers. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    /// Notification when user successfully sign in using Google
    static var signInGoogleCompleted: Notification.Name {
        return .init(rawValue: #function)
    }
}
