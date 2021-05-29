//
//  HomePresenter.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import Foundation

protocol HomePresenterProtocol {
    func didTapCompanyValuesButton()
    func didTapOurPeopleButton()
    func didTapOurAppsButton()
}

final class HomePresenter: HomePresenterProtocol {
    private weak var coordinator: HomeCoordinatorProtocol?
    weak var view: HomeViewController?
    
    init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapCompanyValuesButton() {
        coordinator?.navigateToCompanyValues()
    }
    
    func didTapOurPeopleButton() {
        coordinator?.navigateToOurPeople()
    }
    
    func didTapOurAppsButton() {
        // TODO: - Coordinator add navigate to our apps
    }
}
