//
//  UIView+Extension.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import UIKit

extension UIView {
    func setShadow() {
        layer.shadowColor = ThemeColors.shadowColor.cgColor
        layer.shadowOffset = Constants.shadowOffset
        layer.shadowRadius = Constants.shadowRadius
        layer.shadowOpacity = Constants.shadowOpacity
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
