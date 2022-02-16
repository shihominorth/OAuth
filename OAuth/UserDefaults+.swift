//
//  UserDefaults+.swift.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-12.
//

import Foundation

extension UserDefaults {
    
    private var accessTokenKey: String { "accessTokenKey" }
    
    var accessToken: String {
        get {
            self.string(forKey: accessTokenKey) ?? ""
        }
        set {
            self.setValue(newValue, forKey: accessTokenKey)
        }
    }
}
