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
    
    private unowned var viewController: LoginViewController
    
    private init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules() -> LoginViewController {
        
        guard let view = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? LoginViewController else {
            fatalError()
        }
      
        
        let router = LoginRouter(viewController: view)
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, router: router, interactor: interactor)
        
       
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}


extension LoginRouter: LoginWireframe {
    
    func showAuthentication() {
        
        let url = APIService.shared.oauthURL
        UIApplication.shared.open(url)
        
    }
    
}
