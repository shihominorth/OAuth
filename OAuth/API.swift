//
//  API.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-09.
//

import Foundation
import Alamofire
import SwiftyJSON


enum APIError: Error {
    case invaliedURL
    case postAccesToken
}

class APIService {
    
    static let shared = APIService()
    
    private let host = "https://qiita.com/api/v2/"
    
    private let clientID = "5eea1d95447391fbd3785cd6d442d81b46e36cde"
    private let clientSecret = "d9ea01fff4bce26f8743b97b389033dfc12a654b"
    private let state = "86B3F670AFC10C49"
    
    var oauthURL: URL {
        
        let endpoint = "oauth/authorize"
        
        return URL(string: host + endpoint + "?" + "client_id=\(clientID)" + "&" +
                   "scope=read_qiita+write_qiita" + "&" +
                   "state=\(state)")!
    }
    
    func open(url: URL) {
        
        guard let valiedCode = isValiedCode(url: url) else {
            return
        }
        
        postAccessToken(code: valiedCode) { articles in
            
            print(articles)
            
        } errHandle: { err in
            print(err)
        }

    }
    
    func isValiedCode(url: URL) -> String? {
        
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItems.first(where: {$0.name == "code"})?.value,
              let getState = queryItems.first(where: {$0.name == "state"})?.value,
              getState == APIService.shared.state
        else {
            return nil
        }
        
        return code
        
    }
    
    func postAccessToken(code: String, completion: @escaping ([Article]) -> Void, errHandle: @escaping (Error) -> Void) {
        
        let endPoint = "access_tokens"
        guard let url = URL(string: host + endPoint + "?" +
                            "client_id=\(clientID)" + "&" +
                            "client_secret=\(clientSecret)" + "&" +
                            "code=\(code)") else {
            errHandle(APIError.invaliedURL)
            return
        }

        AF.request(url, method: .post).responseDecodable { (response: AFDataResponse<AccessToken>) in

//            do {
                guard
                    let data = response.data else {
                        errHandle(APIError.postAccesToken)
                    return
                }
                
                let json = try! JSON(data: data)
//                let jsonData = json!["posts"][0]["name"]
                print(json)

        }
        
    }
    
    
    func getMyProfileInfo() {
        
    }
    
    
    
}
