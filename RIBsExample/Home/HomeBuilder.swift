//
//  HomeBuilder.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs

protocol HomeDependency: Dependency {
    
}

final class HomeComponent: Component<HomeDependency> {
    
}

protocol HomeBuildable: Buildable {
    func build(withListener listener: HomeListener) -> HomeRouting
}

final class HomeBuilder: Builder<HomeDependency>, HomeBuildable {
    override init(dependency: HomeDependency) {
        super.init(dependency: dependency)
    }
    
    func build(withListener listener: HomeListener) -> HomeRouting {
        let viewController = HomeViewController()
        let interactor = HomeInteractor(presenter: viewController)
        interactor.listener = listener
        return HomeRouter(interactor: interactor, viewController: viewController)
    }
}
