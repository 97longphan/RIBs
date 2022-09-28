//
//  HomeRouter.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs

protocol HomeInteractable: Interactable {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

protocol HomeViewControllable: ViewControllable {
    
}

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
    override init(interactor: HomeInteractable, viewController: HomeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}



