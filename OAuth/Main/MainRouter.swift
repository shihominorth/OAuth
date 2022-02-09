//
//  MainRouter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol MainWireframe {
    
}

final class MainRouter {
    
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        
        self.viewController = viewController
        
    }
    
    
    static func assembleModules(viewController: UIViewController) -> UIViewController {
        
        let view = MainViewController()
        let router = MainRouter(viewController: view)
        let interactor = MainInteractor()
        let presenter = MainPresenter(
        view: view,
        router: router,
        interactor: interactor
        )
        view.presenter = presenter
        
        return view
        
    }
    
}


extension MainRouter: MainWireframe {}
