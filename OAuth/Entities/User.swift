//
//  User.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-12.
//

import Foundation
import SwiftyJSON

struct User {
    
    let id: String
    let name: String
    let profile_image_url_string: String
   
//    
//    init?(json: JSON) {
//        guard let id = json["id"].string,
//            let name = json["name"].string,
//            let profile_image_url_string = json["profile_image_url"].string,
//            let github_login_name = json["github_login_name"].string,
//        else {
//            return nil
//        }
//        
//        var userName: String {
//            
//            var result = name
//            
//            if name == "" {
//                result = github_login_name
//            }
//            
//            return result
//        }
//        
//        
//        self.id = id
//        self.name = userName
//        self.profile_image_url_string = profile_image_url
//        
//    }
    
}


extension User: Decodable {

    enum CodingKeys: String, CodingKey {
        case id, name, profile_image_url, github_login_name

    }

    init(from decoder: Decoder) throws {

       let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(String.self, forKey: .id)
        
        
        let name = try values.decode(String.self, forKey: .name)
        
        if name == "" {
            self.name = try values.decode(String.self, forKey: .github_login_name)
        }
        else {
            self.name = name
            
        }
            
        self.profile_image_url_string = try values.decode(String.self, forKey: .profile_image_url)
        
   }
    
}


