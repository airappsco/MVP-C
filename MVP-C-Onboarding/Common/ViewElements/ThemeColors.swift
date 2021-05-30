//
//  ThemeColors.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//


import UIKit

enum ThemeColors {
    static let buttonBackgroundColor = UIColor(red: 39/255, green: 105/255, blue: 176/255, alpha: 1.0)
    static let coolBlue = UIColor(red: 42/255, green: 126/255, blue: 254/255, alpha: 1.0) 
    static let homeBackgroundColor = ColorSupport.secondarySystemBackground
    static let labelTextColor = ColorSupport.label
    static let secondaryLabelTextColor = ColorSupport.secondaryLabel
    static let buttonColor = ColorSupport.systemBlue
    static let cellBackgroundColor = ColorSupport.secondarySystemGroupedBackground
    
    // MARK: - Screen tiles
    static let topLeftTileBackgroundColor = ColorSupport.systemBlue
    static let topRightTileBackgroundColor = ColorSupport.systemGreen
    static let bottomLeftTileBackgroundColor = ColorSupport.systemTeal
    static let bottomRightTileColor = ColorSupport.systemOrange
    
    // MARK: - Common for various UI Elements
    static let borderColor = UIColor.white
    static let shadowColor = UIColor.systemGray3
}
