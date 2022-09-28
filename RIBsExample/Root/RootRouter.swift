//
//  RootRouter.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs
protocol RootInteractable: Interactable, LoginListener, HomeListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    private let loginBuilder: LoginBuildable
    private let homeBuilder: HomeBuilder
    private var login: ViewableRouting?
    private var home: ViewableRouting?
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loginBuilder: LoginBuildable,
         homeBuilder: HomeBuilder) {
        self.loginBuilder = loginBuilder
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // need check when press login twice
    // need check lea
    
    func routeToLogin() {
        if login == nil {
            login = loginBuilder.build(withListener: interactor)
        }
        guard let login = login else {
            return
        }
        attachChild(login)
        viewController.present(viewController: login.viewControllable)
    }
    
    func routeToHome() {
        if let child = login {
            detachChild(child)
            viewController.dismiss(viewController: child.viewControllable)
            self.login = nil
        }
        
        let rib = homeBuilder.build(withListener: interactor)
        attachChild(rib)
        viewController.present(viewController: rib.viewControllable)
        
    }
    

}
