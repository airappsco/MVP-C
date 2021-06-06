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
    func didTapTeamFun()
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
        coordinator?.navigateToOurApps()
    }
    
    func didTapTeamFun() {
        coordinator?.navigateToTeamFun()
    }
}
