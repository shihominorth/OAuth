//
//  User.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-12.
//

import Foundation

struct User {
    
    let id: String
    let name: String
    let profile_image_url_string: String
    
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


