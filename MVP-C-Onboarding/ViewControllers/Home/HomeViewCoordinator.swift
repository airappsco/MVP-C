//
//  AppCoordinator.swift
//  MVP-Test
//
//  Created by David on 18/05/2021.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func navigateToCompanyValues()
    func navigateToOurPeople()
    func navigateToOurApps()
}


final class HomeCoordinator: HomeCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
//        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let presenter = HomePresenter(coordinator: self)
        let viewController = HomeViewController(presenter: presenter)
        
        navigationController.setViewControllers([viewController], animated: false)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
    func navigateToCompanyValues() {
        //Navigate to Company Values
        print("Navigate to Company Values called :)")
        let coordinator = CompanyValuesCoordinator(navigationController: navigationController, parent: self)
        start(coordinator)
    }
    
    func navigateToOurPeople() {
        print("Navigating to Our People")
        let coordinator = OurPeopleCoordinator(navigationController: navigationController, parent: self)
        start(coordinator)
    }
    
    func navigateToOurApps() {
        print("Navigating to Our Apps")
        let coordinator = OurAppsCoordinator(navigationController: navigationController, parent: self)
        start(coordinator)
    }
}
