//
//  MainInteractor.swift.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol MainUseCase {
    func getMyInfo(completion: @escaping (Result<([Article], User), Error>) -> Void)
}


final class MainInteractor {
    weak var presenter: MainPresentation?
}


extension MainInteractor: MainUseCase {
    func getMyInfo(completion: @escaping (Result<([Article], User), Error>) -> Void) {
        
        APIService.shared.getMyInfo(completion: completion)
        
    }
    
   
    func getMyInfo(completion: (Result<([Article], User), Error>)) {
        
 
        
    }

}
