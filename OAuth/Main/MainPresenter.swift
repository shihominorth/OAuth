//
//  MainPresenter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol MainPresentation: AnyObject {
    func viewWillAppear()
    func selectedCell(article: Article)
}

final class MainPresenter {
    
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

    func viewWillAppear() {
        
        self.interactor.getMyInfo { result in
            
            switch result {
            case let .success((articles, user)):
                
                self.view?.update(articles: articles, user: user)
                
                
            case let .failure(err):
                
                print(err)
            
            }
            
        }
        
    }
    
    func selectedCell(article: Article) {
        router.edit(article: article)
    }
    

    
}
