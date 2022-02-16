//
//  EditTitleRouter.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import UIKit

protocol EditTitleWireframe: AnyObject{
    func back()
}

final class EditTitleRouter {
    
    private unowned var viewController: EditTitleViewController
    
    private init(viewController: EditTitleViewController) {
        self.viewController = viewController
    }
    
    
    
    static func assembleModules(article: Article) -> UIViewController {
        
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
        view.article = article
        interactor.presenter = presenter
        router.viewController = view
        
        return view
        
    }
}



extension EditTitleRouter: EditTitleWireframe {
    func back() {
        
        guard let navigationController = self.viewController.navigationController else { return }
        navigationController.popViewController(animated: true)
        
    }
}
