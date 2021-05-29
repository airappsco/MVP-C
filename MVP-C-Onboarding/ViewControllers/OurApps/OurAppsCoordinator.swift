//
//  OurAppsCoordinator.swift
//  MVP-C-Onboarding
//
//  Created by David Verbenyi on 25/05/2021.
//

import UIKit

protocol OurAppsCoordinatorProtocol: Coordinator {
    func finish()
}

final class OurAppsCoordinator: OurAppsCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start() {
        let presenter = OurAppsPresenter(coordinator: self)
        let viewController = OurAppsViewController(presenter: presenter)
        presenter.view = viewController
        let ourAppsNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(ourAppsNavigationController, animated: true)
    }
    
    func finish() {
        // TODO: - Implement finish
    }
}
