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
    let profile_image_url: URL
    
    init?(json: JSON) {
        guard let id = json["id"].string,
            let name = json["name"].string,
            let profile_image_url_string = json["profile_image_url"].string,
            let github_login_name = json["github_login_name"].string,
            let profile_image_url = URL(string: profile_image_url_string)
        else {
            return nil
        }
        
        var userName: String {
            
            var result = name
            
            if name == "" {
                result = github_login_name
            }
            
            return result
        }
        
        
        self.id = id
        self.name = userName
        self.profile_image_url = profile_image_url
        
    }
    
}
