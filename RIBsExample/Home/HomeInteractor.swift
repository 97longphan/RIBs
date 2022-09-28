//
//  HomeInteractor.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs
protocol HomeRouting: ViewableRouting {
    
}

protocol HomeListener: AnyObject {
    
}

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
}

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable, HomePresentableListener {
    weak var router: HomeRouting?
    
    weak var listener: HomeListener?
    
    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }
}


