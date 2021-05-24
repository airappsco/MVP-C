//
//  RoundedUIButton.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class RoundUIButton: UIButton {
    
    init(title: String = "No title") {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButton()
   }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted {
                backgroundColor = .white
                setTitleColor(ThemeColors.coolBlue, for: .highlighted)
//                layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            } else {
                backgroundColor = ThemeColors.coolBlue
                titleLabel?.textColor = .white
//                layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            }
        }
    }
    
    private func setupButton() {
        titleLabel?.textColor = .white
        backgroundColor = ThemeColors.coolBlue
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        setShadow()
    }
}

