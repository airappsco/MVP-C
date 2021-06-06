//
//  ClippedCornerRectView.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import UIKit

enum Corners {
    static let topLeft = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
}

final class ClippedCornerRectView: UIView {
    init(round corners: CACornerMask, color: UIColor) {
        super.init(frame: .zero)
        setup(round: corners, color: color)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(round corners: CACornerMask, color: UIColor) {
        backgroundColor = color
        layer.cornerRadius = 20
        layer.maskedCorners = corners
        translatesAutoresizingMaskIntoConstraints = false
        setShadow()
    }
}
