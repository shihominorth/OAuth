//
//  EditInteractor.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import Foundation

protocol EditTitleUseCase: AnyObject {
    func edit(article: Article, title: String, completion: @escaping () -> Void)
}


class EditTitleInteractor {
    weak var presenter: EditTitlePresenter?
}

extension EditTitleInteractor: EditTitleUseCase {
   
    func edit(article: Article, title: String, completion: @escaping () -> Void) {
        
//        APIService.shared.edit(article: article, newTitle: title) { result in
//            
//            switch result {
//            case .success(let article):
//                
//                print(article)
//                
//                completion()
//                
//            case .failure(let err):
//                
//                print(err)
//                
//            }
//            
//        }
        
        
    }
}
