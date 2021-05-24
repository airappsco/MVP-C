//
//  DetailsViewPresenter.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import Foundation


protocol DetailsPresenterProtocol {
    func didTapGoBack()
}

final class DetailsPresenter: DetailsPresenterProtocol {
    private weak var coordinator: DetailsCoordinatorProtocol?
    weak var view: DetailsViewController?
    
    init(coordinator: DetailsCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTapGoBack() {
        print("User tapped go back.")
    }
}
