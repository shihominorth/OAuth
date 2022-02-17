//
//  Artile.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

struct Article {
    
    let id: String
    let url: String
    let title: String
    let lgtm: Int
    let body: String
    let publisher: User
    
}

extension Article: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id, url, title, body, user, lgtm = "likes_count"

    }


    init(from decoder: Decoder) throws {

       let values = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try values.decode(String.self, forKey: .id)
        self.url = try values.decode(String.self, forKey: .url)
        self.title = try values.decode(String.self, forKey: .title)
        self.lgtm = try values.decode(Int.self, forKey: .lgtm)
        self.body = try values.decode(String.self, forKey: .body)
        self.publisher = try values.decode(User.self, forKey: .user)
        
   }
}
