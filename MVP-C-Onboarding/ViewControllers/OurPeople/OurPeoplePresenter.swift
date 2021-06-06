//
//  OurPeoplePresenter.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import Foundation


protocol OurPeoplePresenterProtocol {
    func didTapGoBack()
}

final class OurPeoplePresenter: OurPeoplePresenterProtocol {
    private weak var coordinator: OurPeopleCoordinatorProtocol?
    weak var view: OurPeopleViewController?

    init(coordinator: OurPeopleCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func didTapGoBack() {
        print("User tapped go back from Our People.")
        coordinator?.finish()
    }
}
