//
//  AccessToken.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-10.
//

import Foundation


struct AccessToken: Codable {
    
    let clientId: String
    let scopes: [String]
    let token: String
    
}
