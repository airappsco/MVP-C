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
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        layer.shadowRadius = Constants.shadowRadius
        layer.shadowOpacity = Constants.shadowOpacity
        clipsToBounds = true
        layer.masksToBounds = false
    }
}
