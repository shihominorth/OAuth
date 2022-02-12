//
//  Artile.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation
import SwiftyJSON

struct Article: Codable {
    
    let url: String
    let title: String
    let lgtm: Int
    
    init(url: String, title: String, lgtm: Int) {
       
        self.url = url
        self.title = title
        self.lgtm = lgtm
    
    }
    
    init?(json: JSON) {
    
        guard let url = json["url"].string,
        let title = json["title"].string,
            let lgtm = json["likes_count"].int
        else {
            return nil
        }
        
        
        self.url = url
        self.title = title
        self.lgtm = lgtm
    
    }
    
    
    
}
