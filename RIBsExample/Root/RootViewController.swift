//
//  RootViewController.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import UIKit
import RIBs

// Declare properties and methods that the view controller can invoke to perform
protocol RootPresentableListener: AnyObject {
    
}

class RootViewController: UIViewController, RootViewControllable, RootPresentable {
    weak var listener: RootPresentableListener?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }

}
