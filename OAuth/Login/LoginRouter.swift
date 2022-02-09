//
//  LoginRouter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol LoginWireframe: AnyObject {
    func showAuthentication()
}

class LoginRouter {
    
    private unowned var viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func assembleModeles() -> UIViewController {
        
        let view = LoginViewController()
        let router = LoginRouter(viewController: viewController)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
    
}


extension LoginRouter: LoginWireframe {
    func showAuthentication() {
        
    }
}
