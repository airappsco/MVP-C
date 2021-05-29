//
//  HomeViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let compValuesButton = RoundUIButton(title: "Company Values")
    private let ourPeopleButton = RoundUIButton(title: "Our People")
    
    private let ourAppsButton = RoundUIButton(title: "Our Apps")
    
    private let topLeftTile = ClippedCornerRectView(round: [Corners.topLeft], color: ThemeColors.coolBlue)
    
    private var presenter: HomePresenterProtocol
    
    enum Dimensions {
        static let buttonWidth: CGFloat = 175
        static let buttonHeight: CGFloat = 50
    }

    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Air Onboarding"
        view.backgroundColor = ThemeColors.homeBackgroundColor
        setupTiles()
        setupButtons()
    }
    
    private func setupButtons() {
        setupCompanyValuesButton()
        setupOurPeopleButton()
    }
    
    private func setupTiles() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(topLeftTile)
        topLeftTile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        topLeftTile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 10).isActive = true
        topLeftTile.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        topLeftTile.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 40).isActive = true
    }
    
    private func setupCompanyValuesButton() {
        topLeftTile.addSubview(compValuesButton)
        compValuesButton.centerXAnchor.constraint(equalTo: topLeftTile.centerXAnchor).isActive = true
        compValuesButton.centerYAnchor.constraint(equalTo: topLeftTile.centerYAnchor).isActive = true
        compValuesButton.widthAnchor.constraint(equalToConstant: Dimensions.buttonWidth).isActive = true
        compValuesButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight).isActive = true
        compValuesButton.addTarget(self, action: #selector(tappedCompanyValues), for: .touchUpInside)
    }
    
    private func setupOurPeopleButton() {
        view.addSubview(ourPeopleButton)
        ourPeopleButton.topAnchor.constraint(equalTo: topLeftTile.bottomAnchor, constant: 15).isActive = true
        ourPeopleButton.centerXAnchor.constraint(equalTo: compValuesButton.centerXAnchor).isActive = true
        ourPeopleButton.widthAnchor.constraint(equalTo: compValuesButton.widthAnchor).isActive = true
        ourPeopleButton.heightAnchor.constraint(equalTo: compValuesButton.heightAnchor).isActive = true
        ourPeopleButton.addTarget(self, action: #selector(tappedDetails), for: .touchUpInside)
    }

    @objc private func tappedCompanyValues() {
        presenter.didTapCompanyValuesButton()
    }
    
    @objc private func tappedDetails() {
        presenter.didTapOurPeopleButton()
    }
    
    

}
