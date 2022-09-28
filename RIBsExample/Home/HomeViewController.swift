//
//  HomeViewController.swift
//  RIBsExample
//
//  Created by LONGPHAN on 27/09/2022.
//

import UIKit
protocol HomePresentableListener: AnyObject {
    
}

class HomeViewController: UIViewController {
    weak var listener: HomePresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("HomeViewController deinit")
    }

}

extension HomeViewController: HomePresentable {
    
    
}

extension HomeViewController: HomeViewControllable {
    
}
