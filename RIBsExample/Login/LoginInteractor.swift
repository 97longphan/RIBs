//
//  LoginInteractor.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs
protocol LoginRouting: ViewableRouting {
    
}

protocol LoginListener: AnyObject {
    
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {
    
    weak var router: LoginRouting?

    weak var listener: LoginListener?
    
    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
}


