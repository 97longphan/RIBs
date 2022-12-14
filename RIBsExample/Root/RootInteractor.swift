//
//  RootInteractor.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import Foundation
import RIBs
protocol RootRouting: ViewableRouting {
    func routeToLogin()
    func routeToHome()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
}

protocol RootListener: AnyObject {
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {
    weak var router: RootRouting?
    
    weak var listener: RootListener?
    
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    func didPressToLogin() {
        router?.routeToLogin()
    }
    
    func didLoginSuccess(userName: String) {
        router?.routeToHome()
    }
    
}
