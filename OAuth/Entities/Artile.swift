//
//  Artile.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

class ArticleEntity: Codable{
    
    let url: String
    let title: String
    
    init(url: String, title: String) {
    
        self.url = url
        self.title = title
    
    }
    
}
