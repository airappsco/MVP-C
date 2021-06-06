//
//  ViewController.swift
//  MVP-Onboarding
//
//  Created by David on 18/05/2021.
//

import UIKit

final class CompanyValuesViewController: UIViewController {
    private let placeholderLabel = StandardUILabel(
        text: "Speed \nTransparency",
        fontSize: Dimensions.placeholderLabelFontSize,
        fontStyle: .bold,
        alignment: .left,
        textColor: ThemeColors.labelTextColor,
        multiline: true)
    private var presenter: CompanyValuesPresenterProtocol
    
    enum Dimensions {
        static let placeholderLabelPaddingTop: CGFloat = 30
        static let placeholderLabelPaddingLeft: CGFloat = 20
        static let placeholderLabelPaddingRight: CGFloat = 20
        static let placeholderLabelFontSize: CGFloat = 20
    }

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
        setupViewElements()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.didTapGoBack()
    }
    
    private func setupViewElements() {
        setupPlaceHolderLabel()
    }
    
    private func setupPlaceHolderLabel() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(placeholderLabel)
        placeholderLabel.anchor(
            top: safeArea.topAnchor,
            paddingTop: Dimensions.placeholderLabelPaddingTop,
            left: safeArea.leftAnchor,
            paddingLeft: Dimensions.placeholderLabelPaddingLeft,
            right: safeArea.rightAnchor,
            paddingRight: Dimensions.placeholderLabelPaddingRight)
    }
}
