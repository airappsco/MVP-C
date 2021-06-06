//
//  OurPeopleCoordinator.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import UIKit

protocol OurPeopleCoordinatorProtocol: Coordinator {
    func finish()
}

final class OurPeopleCoordinator: OurPeopleCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }

    func start() {
        let presenter = OurPeoplePresenter(coordinator: self)
        let viewController = OurPeopleViewController(presenter: presenter)
        presenter.view = viewController
        let ourPeopleNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(ourPeopleNavigationController, animated: true)
    }

    func finish() {
        parent?.childDidStop(self)
    }
}
