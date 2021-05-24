//
//  HomeViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let usersButton = RoundUIButton(title: "Users")
    private let detailsButton = RoundUIButton(title: "Details")
    private let topLeftTile = ClippedCornerRectView(round: [Corners.topLeft], color: ThemeColors.coolBlue)
    
    private var presenter: HomePresenterProtocol
    
    enum Dimensions {
        static let buttonWidth: CGFloat = 150
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
        setupButtons()
        setupTiles()
    }
    
    private func setupButtons() {
        setupUsersButton()
        setupDetailsButton()
    }
    
    private func setupTiles() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(topLeftTile)
        topLeftTile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
        topLeftTile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 10).isActive = true
        topLeftTile.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        topLeftTile.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 40).isActive = true
    }
    
    private func setupUsersButton() {
        view.addSubview(usersButton)
        usersButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usersButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        usersButton.widthAnchor.constraint(equalToConstant: Dimensions.buttonWidth).isActive = true
        usersButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight).isActive = true
        usersButton.addTarget(self, action: #selector(tappedUsers), for: .touchUpInside)
    }
    
    func setupDetailsButton() {
        view.addSubview(detailsButton)
        detailsButton.topAnchor.constraint(equalTo: usersButton.bottomAnchor, constant: 15).isActive = true
        detailsButton.centerYAnchor.constraint(equalTo: usersButton.centerYAnchor).isActive = true
        detailsButton.widthAnchor.constraint(equalTo: usersButton.widthAnchor).isActive = true
        detailsButton.heightAnchor.constraint(equalTo: usersButton.heightAnchor).isActive = true
        detailsButton.addTarget(self, action: #selector(tappedDetails), for: .touchUpInside)
    }

    @objc private func tappedUsers() {
        presenter.didTapUsersButton()
    }
    
    @objc private func tappedDetails() {
        presenter.didTapDetailsButton()
    }

}
