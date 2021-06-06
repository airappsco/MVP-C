//
//  OurAppsViewController.swift
//  MVP-C-Onboarding
//
//  Created by David Verbenyi on 25/05/2021.
//

import UIKit

final class OurAppsViewController: UIViewController {
    private var presenter: OurAppsPresenterProtocol

    init(presenter: OurAppsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "📱 Our Apps 📱"
        view.backgroundColor = ThemeColors.ourAppsBackgroundColor
        addPlaceHolderLabel()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
}
