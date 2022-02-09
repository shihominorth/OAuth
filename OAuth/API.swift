//
//  API.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-09.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    private let hostURL = "https://qiita.com/api/v2/"
    private let endpoint = "oauth/authorize"
    private let clientID = "5eea1d95447391fbd3785cd6d442d81b46e36cde"
    private let clientSecret = "d9ea01fff4bce26f8743b97b389033dfc12a654b"
    private let state = "86B3F670AFC10C4908DEC783E7035C524855EC18DB25F126246C8148CB6E9B9AE74E43358BF8F7CFCA2F7AB16DB00B04396E"

    var oauthURL: URL {
        
        return URL(string: hostURL + endpoint +  "client_id=\(clientID)" + "&" +
                   "scope=read_qiita+write_qiita" + "&" +
                   "state=\(state)")!
    }
    
   
    
}
