//
//  LoginViewController.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import UIKit
protocol LoginPresentableListener: AnyObject {
}

class LoginViewController: UIViewController, LoginViewControllable, LoginPresentable {
    weak var listener: LoginPresentableListener?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
