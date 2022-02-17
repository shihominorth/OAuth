//
//  MainInteractor.swift.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol MainUseCase {
    func getMyInfo(completion: @escaping (Result<[Article], Error>) -> Void)
}


final class MainInteractor {
    weak var presenter: MainPresentation?
}


extension MainInteractor: MainUseCase {
    func getMyInfo(completion: @escaping (Result<[Article], Error>) -> Void) {
        
        APIService.shared.getMyArticles(completion: completion)
        
    }


}
