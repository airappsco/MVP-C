//
//  UIViewControllerExtension.swift
//  MVP-C-Onboarding
//
//  Created by David on 06/06/2021.
//

import UIKit

extension UIViewController {
    func addPlaceHolderLabel() {
        let placeHolderLabel = StandardUILabel(text: "Nothing Here Yet", fontSize: Constants.defaultFontSize, fontStyle: .normal, alignment: .center, textColor: ThemeColors.labelTextColor, multiline: false)
        view.addSubview(placeHolderLabel)
        placeHolderLabel.anchor(
            left: view.leftAnchor,
            paddingLeft: Constants.defaultLeftPadding,
            right: view.rightAnchor,
            paddingRight: -Constants.defaultRightPadding,
            centerVertical: view.centerYAnchor)
    }
}
