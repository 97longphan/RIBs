//
//  AppComponent.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
