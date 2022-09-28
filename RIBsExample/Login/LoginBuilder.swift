//
//  LoginBuilder.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs

protocol LoginDependency: Dependency {
    
}

final class LoginComponent: Component<LoginDependency> {
    
}

protocol LoginBuildable: Buildable {
    func build(withListener listener: LoginListener) -> LoginRouting
}

final class LoginBuilder: Builder<LoginDependency>, LoginBuildable {
    
    override init(dependency: LoginDependency) {
        super.init(dependency: dependency)
    }
    
    
    
    func build(withListener listener: LoginListener) -> LoginRouting {
        _  = LoginComponent(dependency: dependency)
        let viewController = LoginViewController()
        let interactor = LoginInteractor(presenter: viewController)
        interactor.listener = listener
        
        return LoginRouter(interactor: interactor, viewController: viewController)
    }
    
    
}
