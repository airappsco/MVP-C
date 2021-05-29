//
//  CompanyValuesCoordinator.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import UIKit

protocol CompanyValuesCoordinatorProtocol: Coordinator {
    func finish()
}

class CompanyValuesCoordinator: CompanyValuesCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start() {
        let presenter = CompanyValuesPresenter(coordinator: self)
        let viewController = CompanyValuesViewController(presenter: presenter)
        presenter.view = viewController
        let usersNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(usersNavigationController, animated: true)
//        let usersViewController = UsersViewController()
//        usersViewController.title = "Coordinator Users"
//        self.usersViewController = usersViewController
    }
    
    
    func finish() {
        print("Finish called")
        // Implement finish
    }
}
