//
//  EditTitleRouter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import UIKit

protocol EditTitleWireframe: AnyObject{
    
}

class EditTitleRouter {
    
    private unowned var viewController: EditTitleViewController
    
    private init(viewController: EditTitleViewController) {
        self.viewController = viewController
    }
    
    
    
    static func assembleModules(title: String) -> UIViewController {
        
        guard let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "editTitleVC") as? EditTitleViewController else {
            fatalError()
        }
        
        let router = EditTitleRouter(viewController: view)
        let interactor = EditTitleInteractor()
        let presenter = EditTitlePresenter(
        view: view,
        router: router,
        interactor: interactor
        )
        view.presenter = presenter
        view.edittingTitle = title
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
}



extension EditTitleRouter: EditTitleWireframe {}
