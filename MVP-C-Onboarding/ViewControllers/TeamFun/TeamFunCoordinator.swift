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
        // START
    }
    
    func finish() {
        // FINISH
    }
}
