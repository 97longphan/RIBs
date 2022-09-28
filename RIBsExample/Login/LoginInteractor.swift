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
    func didLoginSuccess(userName: String)
}

protocol LoginPresentable: Presentable {
    var listener: LoginPresentableListener? { get set }
    func showError(_ text: String)
}

final class LoginInteractor: PresentableInteractor<LoginPresentable>, LoginInteractable, LoginPresentableListener {
    weak var router: LoginRouting?

    weak var listener: LoginListener?
    
    override init(presenter: LoginPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
    
    func didPressLogin(userName: String, pass: String) {
        if userName.isEmpty || pass.isEmpty {
            presenter.showError("Missing info")
            return
        }
        listener?.didLoginSuccess(userName: userName)
    }
    
}


