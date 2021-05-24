//
//  DetailsViewCoordinator.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import Foundation
import UIKit

protocol DetailsCoordinatorProtocol: Coordinator {
    func finish()
}

final class DetailsCoordinator: DetailsCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start() {
        let presenter = DetailsPresenter(coordinator: self)
        let viewController = DetailsViewController(presenter: presenter)
        presenter.view = viewController
        let detailsNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(detailsNavigationController, animated: true)
    }
    
    func finish() {
        // TODO: - Implement finish.
    }
    
}
