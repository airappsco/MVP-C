//
//  HomeViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    private let messageLabel = StandardUILabel(text: "We are Fast 🚀, whilst having a Blast!🎉", fontSize: 15, alignment: .center)

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
        static let buttonWidth: CGFloat = 150
        static let buttonHeight: CGFloat = 50
        static let tileMargin: CGFloat = 10
        static let tileWidth: CGFloat = UIScreen.main.bounds.width / 2 - 40
        static let tileHeight: CGFloat = UIScreen.main.bounds.height / 3
        static let tileMarginFromCenter: CGFloat = 40
        static let messagePaddingFromEdges: CGFloat = 20
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
        setupViewElements()
    }

    private func setupViewElements() {
        setupTiles()
        setupButtons()
        setupMessageLabel()
    }

    private func setupButtons() {
        setupButton(compValuesButton, on: topLeftTile, addTarget: #selector(tappedCompanyValues))
        setupButton(ourAppsButton, on: topRightTile, addTarget: #selector(tappedOurApps))
        setupButton(ourPeopleButton, on: bottomLeftTile, addTarget: #selector(tappedOurPeople))
        setupButton(teamFunButton, on: bottomRightTile, addTarget: #selector(tappedTeamFun))
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

        switch corner {
        case Corners.topLeft:
            tile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.rightAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -Dimensions.tileMarginFromCenter).isActive = true
            tile.bottomAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -Dimensions.tileMarginFromCenter).isActive = true
        case Corners.topRight:
            tile.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: Dimensions.tileMarginFromCenter).isActive = true
            tile.bottomAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -Dimensions.tileMarginFromCenter).isActive = true
        case Corners.bottomLeft:
            tile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: Dimensions.tileMargin).isActive = true
            tile.rightAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -Dimensions.tileMarginFromCenter).isActive = true
            tile.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: Dimensions.tileMarginFromCenter).isActive = true
        case Corners.bottomRight:
            tile.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -Dimensions.tileMargin).isActive = true
            tile.leftAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: Dimensions.tileMarginFromCenter).isActive = true
            tile.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: Dimensions.tileMarginFromCenter).isActive = true
        default:
            break
        }
    }

    private func setupButton(_ button: UIButton, on tile: ClippedCornerRectView, addTarget action: Selector, for event: UIControl.Event = .touchUpInside) {
        tile.addSubview(button)
        button.anchor(
            width: Dimensions.buttonWidth,
            height: Dimensions.buttonHeight,
            centerHorizontal: tile.centerXAnchor,
            centerVertical: tile.centerYAnchor)
        button.addTarget(self, action: action, for: event)
    }

    private func setupMessageLabel() {
        let safeArea = view.safeAreaLayoutGuide
        view.addSubview(messageLabel)
//        messageLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
//        messageLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 20).isActive = true
//        messageLabel.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -20).isActive = true
        // The constraints set below are from the UIViewExtension.swift, they do exactly the same as the lines commented out above.
        messageLabel.anchor(
            left: safeArea.leftAnchor,
            paddingLeft: Dimensions.messagePaddingFromEdges,
            right: safeArea.rightAnchor,
            paddingRight: -Dimensions.messagePaddingFromEdges,
            centerVertical: safeArea.centerYAnchor)
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
        presenter.didTapTeamFun()
    }

    // add your new tapHandler below:
}
