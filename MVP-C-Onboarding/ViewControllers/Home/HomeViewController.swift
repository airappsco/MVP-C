//
//  HomeViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // Navigation buttons
    private let compValuesButton = RoundUIButton(title: "Company Values", color: ThemeColors.topLeftTileColor)
    private let ourPeopleButton = RoundUIButton(title: "Our People", color: ThemeColors.bottomLeftTileColor)
    private let ourAppsButton = RoundUIButton(title: "Our Apps", color: ThemeColors.topRightTileColor)
    private let teamFunButton = RoundUIButton(title: "Team Fun", color: ThemeColors.bottomRightTileColor)
    
    // Tiles
    private let topLeftTile = ClippedCornerRectView(
        round: [Corners.topLeft],
        color: ThemeColors.topLeftTileColor)
    
    private let topRightTile = ClippedCornerRectView(
        round: [Corners.topRight],
        color: ThemeColors.topRightTileColor)
    
    private let bottomLeftTile = ClippedCornerRectView(
        round: [Corners.bottomLeft],
        color: ThemeColors.bottomLeftTileColor)
    
    private let bottomRightTile = ClippedCornerRectView(
        round: [Corners.bottomRight],
        color: ThemeColors.bottomRightTileColor)
    
    private var presenter: HomePresenterProtocol
    
    enum Dimensions {
        static let buttonWidth: CGFloat = 175
        static let buttonHeight: CGFloat = 50
        static let tileMargin: CGFloat = 10
        static let tileWidth: CGFloat = UIScreen.main.bounds.width / 2 - 40
        static let tileHeight: CGFloat = UIScreen.main.bounds.height / 3
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
        setupOurAppsButton()
        setupTeamFunButton()
    }
    
    private func setupTiles() {
        setupTile(topLeftTile, in: Corners.topLeft)
        setupTile(topRightTile, in: Corners.topRight)
        setupTile(bottomLeftTile, in: Corners.bottomLeft)
        setupTile(bottomRightTile, in: Corners.bottomRight)
    }
    
    private func setupTile(_ tile: ClippedCornerRectView, in corner: CACornerMask) {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(tile)
        tile.widthAnchor.constraint(equalToConstant: Dimensions.tileWidth).isActive = true
        tile.heightAnchor.constraint(equalToConstant: Dimensions.tileHeight).isActive = true
        
        switch corner {
        case Corners.topLeft:
            tile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: Dimensions.tileMargin).isActive = true
        case Corners.topRight:
            tile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -Dimensions.tileMargin).isActive = true
        case Corners.bottomLeft:
            tile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: Dimensions.tileMargin).isActive = true
        case Corners.bottomRight:
            tile.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -Dimensions.tileMargin).isActive = true
        default:
            break
        }
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
        bottomLeftTile.addSubview(ourPeopleButton)
        ourPeopleButton.centerXAnchor.constraint(equalTo: bottomLeftTile.centerXAnchor).isActive = true
        ourPeopleButton.centerYAnchor.constraint(equalTo: bottomLeftTile.centerYAnchor).isActive = true
        ourPeopleButton.widthAnchor.constraint(equalToConstant: Dimensions.buttonWidth).isActive = true
        ourPeopleButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight).isActive = true
        ourPeopleButton.addTarget(self, action: #selector(tappedOurPeople), for: .touchUpInside)
    }
    
    private func setupOurAppsButton() {
        topRightTile.addSubview(ourAppsButton)
        ourAppsButton.centerXAnchor.constraint(equalTo: topRightTile.centerXAnchor).isActive = true
        ourAppsButton.centerYAnchor.constraint(equalTo: topRightTile.centerYAnchor).isActive = true
        ourAppsButton.widthAnchor.constraint(equalToConstant: Dimensions.buttonWidth).isActive = true
        ourAppsButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight).isActive = true
        ourAppsButton.addTarget(self, action: #selector(tappedOurApps), for: .touchUpInside)
    }
    
    private func setupTeamFunButton() {
        bottomRightTile.addSubview(teamFunButton)
        teamFunButton.centerXAnchor.constraint(equalTo: bottomRightTile.centerXAnchor).isActive = true
        teamFunButton.centerYAnchor.constraint(equalTo: bottomRightTile.centerYAnchor).isActive = true
        teamFunButton.widthAnchor.constraint(equalToConstant: Dimensions.buttonWidth).isActive = true
        teamFunButton.heightAnchor.constraint(equalToConstant: Dimensions.buttonHeight).isActive = true
        teamFunButton.addTarget(self, action: #selector(tappedTeamFun), for: .touchUpInside)
    }

    @objc private func tappedCompanyValues() {
        presenter.didTapCompanyValuesButton()
    }
    
    @objc private func tappedOurPeople() {
        presenter.didTapOurPeopleButton()
    }

    @objc private func tappedOurApps() {
        presenter.didTapOurAppsButton()
    }
    
    @objc private func tappedTeamFun() {
        // TODO: - Add didTapTeamFunButton to the presenter and implement call here
    }

}
