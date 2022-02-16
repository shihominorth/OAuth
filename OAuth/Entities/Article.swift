//
//  Artile.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation
import SwiftyJSON

struct Article {
    
    let id: String
    let url: String
    let title: String
    let lgtm: Int
    let body: String

    enum CodingKeys: String, CodingKey {
        case id, url, title, body, lgtm = "likes_count"

    }

    init(id: String, url: String, title: String, lgtm: Int, body: String) {
       
        self.id = id
        self.url = url
        self.title = title
        self.lgtm = lgtm
        self.body = body
    
    }
    
    init?(json: JSON) {
    
        guard
            let id = json["id"].string,
            let url = json["url"].string,
            let title = json["title"].string,
            let lgtm = json["likes_count"].int,
            let body = json["body"].string
        else {
            return nil
        }
        
        self.id = id
        self.url = url
        self.title = title
        self.lgtm = lgtm
        self.body = body
    
    }
    
   
    
    
}

extension Article: Codable {

    init(from decoder: Decoder) throws {
   
       let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decode(String.self, forKey: .id)
        url = try values.decode(String.self, forKey: .url)
        title = try values.decode(String.self, forKey: .title)
        lgtm = try values.decode(Int.self, forKey: .lgtm)
        body = try values.decode(String.self, forKey: .body)
        
   
   }
}
