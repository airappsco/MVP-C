//
//  TeamFunPresenter.swift
//  MVP-C-Onboarding
//
//  Created by David on 02/06/2021.
//

import Foundation

protocol TeamFunPresenterProtocol {
    func didTapGoBack()
}

final class TeamFunPresenter: TeamFunPresenterProtocol {
    private weak var coordinator: TeamFunCoordinatorProtocol?
    weak var view: TeamFunViewController?
    
    init(coordinator: TeamFunCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapGoBack() {
        print("User tapped go back from Team Fun")
    }
}
