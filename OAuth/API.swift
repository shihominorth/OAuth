//
//  API.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-09.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    private let host = "https://qiita.com/api/v2/"
 
    private let clientID = "5eea1d95447391fbd3785cd6d442d81b46e36cde"
    private let clientSecret = "d9ea01fff4bce26f8743b97b389033dfc12a654b"
    private let state = "86B3F670AFC10C49"

    var oauthURL: URL {
        
        let endpoint = "oauth/authorize"
        
        return URL(string: host + endpoint + "client_id=\(clientID)" + "&" +
                   "scope=read_qiita+write_qiita" + "&" +
                   "state=\(state)")!
    }
    
   
    
}
