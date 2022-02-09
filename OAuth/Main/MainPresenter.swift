//
//  MainPresenter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol MainPresentation: AnyObject {
    func getArticles()
}

class MainPresenter {
    
    private weak var view: MainView?
    private let router: MainWireframe
    private let interactor: MainUseCase
    
    init(view: MainView, router: MainWireframe, interactor: MainUseCase) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
}


extension MainPresenter: MainPresentation {
    
    func getArticles() {
        self.interactor.getArticles()
    }
    
}
