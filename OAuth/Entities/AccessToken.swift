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
    
    
    init?(json: JSON) {
    
        guard let token = json["token"].string,
        let scopes = json["scopes"].arrayObject as? [String],
            let clientId = json["client_id"].string else {
            return nil
        }
        
        self.token = token
        self.clientId = clientId
        self.scopes = scopes
        
    }
    
}
