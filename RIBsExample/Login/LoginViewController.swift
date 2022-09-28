//
//  LoginViewController.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginPresentableListener: AnyObject {
    func didPressLogin(userName: String, pass: String)
}

class LoginViewController: UIViewController {
    
    weak var listener: LoginPresentableListener?
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.listener?.didPressLogin(userName: self.userNameTF.text ?? "", pass: self.passTF.text ?? "")
            }).disposed(by: disposeBag)
    }
    
    deinit {
        print("LoginViewController deinit")
    }
}

extension LoginViewController: LoginViewControllable {

}

extension LoginViewController: LoginPresentable {
    func showError(_ text: String) {
        let alert = UIAlertController(title: "Error", message: text, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}


