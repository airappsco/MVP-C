//
//  UIView+Extension.swift
//  MVP-C-Onboarding
//
//  Created by David on 23/05/2021.
//

import UIKit
// swiftlint:disable file_length

enum ConstraintRelation {
    case equalTo
    case lessThanOrEqual
    case greaterThanOrEqual
}

extension UIView {
    func setShadow() {
        layer.shadowColor = ThemeColors.shadowColor.cgColor
        layer.shadowOffset = Constants.shadowOffset
        layer.shadowRadius = Constants.shadowRadius
        layer.shadowOpacity = Constants.shadowOpacity
        clipsToBounds = true
        layer.masksToBounds = false
    }

    func insertHorizontalGradient(_ color1: UIColor, _ color2: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = frame.size
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.locations = [0, 0.5]
        gradientLayer.colors = [color1.withAlphaComponent(0).cgColor, color2.withAlphaComponent(1).cgColor]
        layer.addSublayer(gradientLayer)
    }

    func setAlphaInvisible(_ invisible: Bool) {
        alpha = invisible ? 0 : 1
    }

    var parentViewController: UIViewController? {
        sequence(first: self) { $0.next }
            .first { $0 is UIViewController }
            .flatMap { $0 as? UIViewController }
    }
}

extension UIView {
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingLeading: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        paddingTrailing: CGFloat = 0,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        centerHorizontal: NSLayoutXAxisAnchor? = nil,
        centerVertical: NSLayoutYAxisAnchor? = nil,
        enableInsets: Bool = false
    ) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)

        if enableInsets {
            if #available(iOS 11.0, *) {
                topInset = safeAreaInsets.top
                bottomInset = safeAreaInsets.bottom
            }
        }

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop + topInset).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom - bottomInset).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let centerVertical = centerVertical {
            centerYAnchor.constraint(equalTo: centerVertical).isActive = true
        }
        if let centerHorizontal = centerHorizontal {
            centerXAnchor.constraint(equalTo: centerHorizontal).isActive = true
        }
    }

    static var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows.first
            let bottomPadding = window?.safeAreaInsets.bottom
            return bottomPadding ?? CGFloat(0)
        } else {
            return 0
        }
    }

    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        left: NSLayoutXAxisAnchor? = nil,
        paddingLeft: CGFloat = 0,
        right: NSLayoutXAxisAnchor? = nil,
        paddingRight: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil,
        paddingBottom: CGFloat = 0,
        centerHorizontal: NSLayoutXAxisAnchor? = nil,
        centerVertical: NSLayoutYAxisAnchor? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let centerVertical = centerVertical {
            centerYAnchor.constraint(equalTo: centerVertical).isActive = true
        }

        if let centerHorizontal = centerHorizontal {
            centerXAnchor.constraint(equalTo: centerHorizontal).isActive = true
        }
    }

    @discardableResult
    func leadingAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == leadingAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = leadingAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func trailingAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == trailingAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = trailingAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func leftAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == leftAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = leftAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = leftAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = leftAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func rightAnchor(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == rightAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = rightAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = rightAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = rightAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func topAnchor(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == topAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = topAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = topAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func bottomAnchor(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == bottomAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = bottomAnchor.constraint(equalTo: anchor, constant: -constant)
        case .greaterThanOrEqual:
            constraint = bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: -constant)
        case .lessThanOrEqual:
            constraint = bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: -constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func widthAnchor(
        relation: ConstraintRelation = .equalTo,
        equalTo constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == widthAnchor }?.isActive = false
        var heightConstraint: NSLayoutConstraint
        switch relation {
        case .equalTo:
            heightConstraint = widthAnchor.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            heightConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            heightConstraint = widthAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        heightConstraint.priority = priority
        heightConstraint.isActive = true
        return heightConstraint
    }

    @discardableResult
    func heightAnchor(
        relation: ConstraintRelation = .equalTo,
        equalTo constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == heightAnchor }?.isActive = false
        var heightConstraint: NSLayoutConstraint
        switch relation {
        case .equalTo:
            heightConstraint = heightAnchor.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            heightConstraint = heightAnchor.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            heightConstraint = heightAnchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        heightConstraint.priority = priority
        heightConstraint.isActive = true
        return heightConstraint
    }

    @discardableResult
    func heightAnchor(
        equalTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == heightAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = heightAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = heightAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        @unknown default:
            return nil
        }
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func widthAnchor(
        equalTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == widthAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = widthAnchor.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = widthAnchor.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        @unknown default:
            return nil
        }
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerHorizontal(
        equalTo anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == centerXAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = centerXAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    func centerVertical(
        equalTo anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        relation: NSLayoutConstraint.Relation = .equal,
        priority: UILayoutPriority = .required
    ) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        constraints.first { $0 == centerYAnchor }?.isActive = false

        var constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = centerYAnchor.constraint(equalTo: anchor, constant: constant)
        case .greaterThanOrEqual:
            constraint = centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        case .lessThanOrEqual:
            constraint = centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        @unknown default:
            return nil
        }
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }

    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        } else {
            return leftAnchor
        }
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        } else {
            return rightAnchor
        }
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }

    func setWidth(relation: NSLayoutConstraint.Relation, value: CGFloat = 0, multiplier: CGFloat = 1) {
        if let widthConstraint = constraints.first(where: { $0 == widthAnchor }) {
            removeConstraint(widthConstraint)
        }
        addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .width,
                relatedBy: relation,
                toItem: nil,
                attribute: .width,
                multiplier: multiplier,
                constant: value
            )
        )
    }

    func setHeight(relation: NSLayoutConstraint.Relation, value: CGFloat = 0, multiplier: CGFloat = 1) {
        translatesAutoresizingMaskIntoConstraints = false
        if let heightConstraint = constraints.first(where: { $0 == heightAnchor }) {
            removeConstraint(heightConstraint)
        }
        addConstraint(
            NSLayoutConstraint(
                item: self,
                attribute: .height,
                relatedBy: relation,
                toItem: nil,
                attribute: .height,
                multiplier: multiplier,
                constant: value
            )
        )
    }

    var topConstraint: NSLayoutConstraint? {
        constraints.first {
            ($0.firstAttribute == .top && $0.firstItem as? UIView == self) ||
            ($0.secondAttribute == .top && $0.secondItem as? UIView == self)
        }
    }

    var heightConstraint: NSLayoutConstraint? {
        constraints.first {
            ($0.firstAttribute == .height && $0.firstItem as? UIView == self) ||
            ($0.secondAttribute == .height && $0.secondItem as? UIView == self)
        }
    }
}

