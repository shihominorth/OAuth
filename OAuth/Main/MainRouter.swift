//
//  MainRouter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-08.
//

import UIKit

protocol MainWireframe {
    func edit(title: String)
}

final class MainRouter {
    
    private unowned var viewController: UIViewController
    
    private init(viewController: UIViewController) {
        
        self.viewController = viewController
        
        
    }
    
    
    static func assembleModules() -> UIViewController {
        
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVC") as? MainViewController else {
            fatalError()
        }
        
        let router = MainRouter(viewController: view)
        let interactor = MainInteractor()
        let presenter = MainPresenter(
        view: view,
        router: router,
        interactor: interactor
        )
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
    
}


extension MainRouter: MainWireframe {
    
    func edit(title: String) {
        
        guard let navigationController = viewController.navigationController else { return }
        let editTitleVC = EditTitleRouter.assembleModules(title: title)
        
        navigationController.pushViewController(editTitleVC, animated: true)
    
    }
    
}
