//
//  OurPeopleViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class OurPeopleViewController: UIViewController {
    private var presenter: OurPeoplePresenterProtocol

    init(presenter: OurPeoplePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "🦸 Our Heroes 🦸‍♀️"
        view.backgroundColor = ThemeColors.ourPeopleBackgroundColor
        addPlaceHolderLabel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
}
