//
//  TeamFunCoordinator.swift
//  MVP-C-Onboarding
//
//  Created by David on 02/06/2021.
//

import UIKit

protocol TeamFunCoordinatorProtocol: Coordinator {
    func finish()
}

final class TeamFunCoordinator: TeamFunCoordinatorProtocol {
    private weak var parent: Coordinator?
    var childCoordinators = [Coordinator]()
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, parent: Coordinator) {
        self.navigationController = navigationController
        self.parent = parent
    }
    
    func start() {
        let presenter = TeamFunPresenter(coordinator: self)
        let viewController = TeamFunViewController(presenter: presenter)
        presenter.view = viewController
        let teamFunNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(teamFunNavigationController, animated: true)
    }
    
    func finish() {
        // FINISH
    }
}
