//
//  TeamFunViewController.swift
//  MVP-C-Onboarding
//
//  Created by David on 02/06/2021.
//

import UIKit

final class TeamFunViewController: UIViewController {
    private var presenter: TeamFunPresenterProtocol

    init(presenter: TeamFunPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "🥳🤪 Team Fun 😎🥳"
        view.backgroundColor = ThemeColors.teamFunBackgroundColor
        addPlaceHolderLabel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
}
