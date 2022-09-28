//
//  RootViewController.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import UIKit
import RIBs
import RxCocoa
import RxSwift

// Declare properties and methods that the view controller can invoke to perform
protocol RootPresentableListener: AnyObject {
    func didPressToLogin()
}

class RootViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    weak var listener: RootPresentableListener?
    @IBOutlet weak var toLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toLoginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.listener?.didPressToLogin()
            }).disposed(by: disposeBag)
    }
}

extension RootViewController: RootViewControllable {
    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}

extension RootViewController: RootPresentable {
    
}
