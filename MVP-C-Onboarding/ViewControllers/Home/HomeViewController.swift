//
//  HomeViewController.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let compValuesButton = RoundUIButton(title: "Company Values")
    private let ourPeopleButton = RoundUIButton(title: "Our People", color: ThemeColors.bottomLeftTileColor)
    
    private let ourAppsButton = RoundUIButton(title: "Our Apps")
    
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
