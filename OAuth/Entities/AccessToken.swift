//
//  AccessToken.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-10.
//

import Foundation
import SwiftyJSON

struct AccessToken {
    
    let clientId: String
    let scopes: [String]
    let token: String
    
}

extension AccessToken: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case cilendId = "client_id", scopes, token

    }

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.clientId = try values.decode(String.self, forKey: .cilendId)
        self.scopes = try values.decode([String].self, forKey: .scopes)
        self.token = try values.decode(String.self, forKey: .token)
        
   }
    
    
//    init?(json: JSON) {
//    
//        guard let token = json["token"].string,
//        let scopes = json["scopes"].arrayObject as? [String],
//            let clientId = json["client_id"].string else {
//            return nil
//        }
//        
//        self.token = token
//        self.clientId = clientId
//        self.scopes = scopes
//        
//    }
    
}
