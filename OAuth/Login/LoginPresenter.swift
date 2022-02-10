//
//  LoginPresenter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol LoginPresentation: AnyObject {
    func loginButtonTapped()
    func showMyArtiles(url: URL)
}

class LoginPresenter {
    
    private weak var view: LoginView?
    private let router: LoginWireframe
    private let interactor: LoginUseCase
    
    init(view: LoginView, router: LoginWireframe, interactor: LoginUseCase) {
        
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
}


extension LoginPresenter: LoginPresentation {

    func loginButtonTapped() {
        router.showAuthentication()
    }
    
    
    func showMyArtiles(url: URL) {
        interactor.showMyArticles(url: url)
    }
    
}
