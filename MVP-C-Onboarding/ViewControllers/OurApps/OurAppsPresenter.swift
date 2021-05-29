//
//  OurAppsPresenter.swift
//  MVP-C-Onboarding
//
//  Created by David Verbenyi on 25/05/2021.
//

import Foundation

protocol OurAppsPresenterProtocol {
    func didTapGoBack()
}

final class OurAppsPresenter: OurAppsPresenterProtocol {
    private weak var coordinator: OurAppsCoordinatorProtocol?
    weak var view: OurAppsViewController?
    
    init(coordinator: OurAppsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapGoBack() {
        print("User tapped go back from Our Apps")
    }
}
