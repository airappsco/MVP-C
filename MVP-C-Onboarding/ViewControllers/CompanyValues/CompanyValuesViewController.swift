//
//  ViewController.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import UIKit

final class CompanyValuesViewController: UIViewController {
    private var presenter: CompanyValuesPresenterProtocol

    init(presenter: CompanyValuesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Air Apps Goals ⚽️ and Values 💎"
        view.backgroundColor = ThemeColors.companyValuesBackgroundColor
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
}
