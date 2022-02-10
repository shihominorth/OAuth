//
//  LoginInteractor.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import Foundation

protocol LoginUseCase: AnyObject {
    func showMyArticles(url: URL)
}

final class LoginInteractor {
    weak var presenter: LoginPresentation?
}

extension LoginInteractor: LoginUseCase {
    
    func showMyArticles(url: URL) {
      
    }
   
}
