//
//  CompanyValuesPresenter.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import UIKit

protocol CompanyValuesPresenterProtocol {
    func didTapGoBack()
}

final class CompanyValuesPresenter: CompanyValuesPresenterProtocol {
    private weak var coordinator: CompanyValuesCoordinatorProtocol?
    weak var view: CompanyValuesViewController?

    init(coordinator: CompanyValuesCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func didTapGoBack() {
        print("User tapped go back from Company Values.")
        coordinator?.finish()
    }
}
