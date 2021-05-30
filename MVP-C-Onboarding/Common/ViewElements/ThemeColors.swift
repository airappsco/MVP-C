//
//  ThemeColors.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//


import UIKit

enum ThemeColors {
    // MARK: - Home Screen
    static let homeBackgroundColor = ColorSupport.secondarySystemBackground
    // Tiles
    static let topLeftTileColor = ColorSupport.systemBlue
    static let topRightTileColor = ColorSupport.systemGreen
    static let bottomLeftTileColor = ColorSupport.systemRed
    static let bottomRightTileColor = ColorSupport.systemOrange

    // MARK: - Company Values Screen
    static let companyValuesBackgroundColor = ColorSupport.systemBlue

    // MARK: - Our People Screen
    static let ourPeopleBackgroundColor = ColorSupport.systemRed

    // MARK: - Our Apps Screen
    static let ourAppsBackgroundColor = ColorSupport.systemGreen

    // MARK: - Team Fun Screen
    static let teamFunBackgroundColor = ColorSupport.systemOrange

    // MARK: - Common for various UI Elements
    static let borderColor = UIColor.white
    static let shadowColor = ColorSupport.systemGray3
    static let labelTextColor = ColorSupport.label
    static let secondaryLabelTextColor = ColorSupport.secondaryLabel
    static let buttonColor = ColorSupport.systemBlue
    static let cellBackgroundColor = ColorSupport.secondarySystemGroupedBackground
}
