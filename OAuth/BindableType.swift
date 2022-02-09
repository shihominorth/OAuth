//
//  BindableType.swift
//  OAuth
//
//  Created by 北島　志帆美 on 2022-02-09.
//

import UIKit

protocol BindableType {
  
    associatedtype PresentationType
  
    var presenter: PresentationType! { get set }
    
 
}

extension BindableType where Self: UIViewController {
  mutating func setPresenter(to model: Self.PresentationType) {
    presenter = model
    loadViewIfNeeded()
  }
}
