//
//  Coordinator.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }

    func childDidStop(_ child: Coordinator)
    func start()
}

extension Coordinator {
    func start(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func childDidStop(_ child: Coordinator) {
//        childCoordinators.removeAll { $0 === child }
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                print("Child coordinator has been removed at index: \(index), \(coordinator)")
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
