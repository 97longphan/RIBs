//
//  Navigation+Extension.swift
//  RIBsExample
//
//  Created by LONGPHAN on 28/09/2022.
//

import UIKit
import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController { return self }

    public convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
}
