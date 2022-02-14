//
//  EditInteractor.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-14.
//

import Foundation

protocol EditTitleUseCase: AnyObject {
    
}


class EditTitleInteractor {
    weak var presenter: EditTitlePresenter?
}

extension EditTitleInteractor: EditTitleUseCase {}
