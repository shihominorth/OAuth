//
//  EditTitlePresenter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import Foundation

protocol EditTitlePresentation: AnyObject {
    func didEditBtnTapped(article: Article, newTitle: String)
}

class EditTitlePresenter {
    
    private weak var view: EditTitleView?
    private let router: EditTitleWireframe?
    private let interactor: EditTitleUseCase?
    
    init(view: EditTitleView, router: EditTitleWireframe, interactor: EditTitleUseCase) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
}

extension EditTitlePresenter: EditTitlePresentation {
    
    func didEditBtnTapped(article: Article, newTitle: String) {
        
        self.interactor?.edit(article: article, title: newTitle) { [unowned self] in
            self.router?.back()
        }
        
    }
    
   
}
