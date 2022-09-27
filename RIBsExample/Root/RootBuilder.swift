//
//  RootBuilder.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs
protocol RootDependency: Dependency {
    
}

final class RootComponent: Component<RootDependency> {
    let rootViewController: RootViewController

    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
    func build() -> LaunchRouting {
        let viewController = RootViewController()
        let component = RootComponent(dependency: dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController)
        let loginBuilder = LoginBuilder(dependency: component)
        
        return RootRouter(interactor: interactor, viewController: viewController, loginBuilder: loginBuilder)
    }
    
    
}
