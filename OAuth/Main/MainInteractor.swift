//
//  MainInteractor.swift.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol MainUseCase {
    func getArticles()
}


class MainInteractor {
    weak var presenter: MainPresentation?
}


extension MainInteractor: MainUseCase {
    func getArticles() {
        
    }
}
