//
//  HomePresenter.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import Foundation

protocol HomePresenterProtocol {
    func didTapUsersButton()
    func didTapDetailsButton()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewController?
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapUsersButton() {
        coordinator?.navigateToUsers()
    }
    
    func didTapDetailsButton() {
        coordinator?.navigateToDetails()
    }
}
