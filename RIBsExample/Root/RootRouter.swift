//
//  RootRouter.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs
protocol RootInteractable: Interactable, LoginListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    private let loginBuilder: LoginBuildable
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loginBuilder: LoginBuildable ) {
        self.loginBuilder = loginBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        print("did load success")
    }
}
