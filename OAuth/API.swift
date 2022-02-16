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
    case invaliedData
    case invaliedURL
    case postAccesToken
    case getItems
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
    
    
    func open(url: URL, completion: @escaping (Error?) -> Void) {
        
        guard let valiedCode = isValiedCode(url: url) else {
            return
        }
        
        postAccessToken(code: valiedCode) { response in
            
            switch response {
            case .success(let accessToken):
                
                UserDefaults.standard.accessToken = accessToken.token
                
                completion(nil)
                
            case .failure(let err):
                
                completion(err)
                
            }
            
        }
        
        
    }
    
    
    private func isValiedCode(url: URL) -> String? {
        
        guard let queryItems = URLComponents(string: url.absoluteString)?.queryItems,
              let code = queryItems.first(where: {$0.name == "code"})?.value,
              let getState = queryItems.first(where: {$0.name == "state"})?.value,
              getState == APIService.shared.state
        else {
            return nil
        }
        
        return code
        
    }
    
    private func postAccessToken(code: String, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        
        
        let endPoint = "access_tokens"
        guard let url = URL(string: host + endPoint + "?" +
                            "client_id=\(clientID)" + "&" +
                            "client_secret=\(clientSecret)" + "&" +
                            "code=\(code)") else {
            completion(.failure(APIError.invaliedURL))
            return
        }
        
        AF.request(url, method: .post).responseDecodable { (response: AFDataResponse<AccessToken>) in
            
            do {
                guard
                    let data = response.data else {
                        completion(.failure(APIError.postAccesToken))
                        return
                    }
                
                
                if let err = response.error {
                    completion(.failure(err))
                }
                
                let json = try? JSON(data: data)
                guard let jsonData = json, let accessToken = AccessToken(json: jsonData) else {
                    return
                }
                
                print(json)
                
                completion(.success(accessToken))
                
            }
        }
        
    }
    
    func getMyInfo(completion: @escaping (Result<([Article], User), Error>) -> Void){
        
        getMyArticles { result in
            
            switch result {
            case let .success((articles, user)):
                
                completion(.success((articles, user)))
                
            case .failure(let err):
                completion(.failure(err))
            }
            
        }
        
    }
    
    
    func getMyArticles(completion: @escaping (Result<([Article], User), Error>) -> Void) {
        
        let endPoint = "authenticated_user/items"
        
        guard let url = URL(string: host + endPoint),
              
                !UserDefaults.standard.accessToken.isEmpty else {
                    completion(.failure(APIError.getItems))
                    
                    return
                }
        
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserDefaults.standard.accessToken)"
        ]
        let parameters = [
            "page": 1,
            "per_page": 20
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers).responseDecodable { (response: AFDataResponse<[Article]>) in
            
            do {
                guard
                    let data = response.data else {
                        completion(.failure(APIError.invaliedData))
                        return
                    }
                if let err = response.error {
                    completion(.failure(err))
                }
                
                let json = try? JSON(data: data)
                guard
                    let jsonData = json
                        
                else {
                    return
                }
                
                if let unwrappedData = jsonData.array, let myProfileJSON = unwrappedData.first?["user"], let user = User(json: myProfileJSON) {
                    
                    let articles = unwrappedData.compactMap { Article(json: $0) }
                    completion(.success((articles, user)))
                    
                }
                
                
            }
            
        }
        
        
    }
    
    
    func edit(article: Article, newTitle: String, completion: @escaping (Result<Article, Error>) -> Void) {
        
        let endPoint = "items/\(article.id)"
        let urlString = host + endPoint
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(UserDefaults.standard.accessToken)"
        ]
        
        let parameters = [
            "body": article.body,
            "title": newTitle
        ]
        
        
        AF.request(url, method: .patch, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable { (response: AFDataResponse<Article>) in
            
            do {
                guard
                    let data = response.data,  let dataString = String(data: data, encoding: .utf8) else {
                        completion(.failure(APIError.invaliedData))
                        return
                    }

                print(dataString)

                if let err = response.error {
                
                    completion(.failure(err))
                
                }
                else {
                    
                    let json = try? JSON(data: data)
                    guard
                        let jsonData = json,
                        let article = Article(json: jsonData)
                    else {
                        return
                    }
                    
                    completion(.success(article))
                        
                }
               
                
            }
            
            
        }
        
        
    }
    
}
