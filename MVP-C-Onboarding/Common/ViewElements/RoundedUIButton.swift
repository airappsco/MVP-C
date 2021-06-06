//
//  RoundedUIButton.swift
//  MVP-Onboarding
//
//  Created by David on 19/05/2021.
//

import UIKit

final class RoundUIButton: UIButton {
    
    let mainColor: UIColor
        
    init(title: String = "No title", color: UIColor = ThemeColors.buttonColor) {
        mainColor = color
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButton()
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted {
                backgroundColor = ThemeColors.buttonTextColor
                setTitleColor(mainColor, for: .highlighted)
            } else {
                backgroundColor = mainColor
                titleLabel?.textColor = ThemeColors.buttonTextColor
            }
        }
    }
    
    private func setupButton() {
        titleLabel?.textColor = ThemeColors.buttonTextColor
        backgroundColor = mainColor
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderColor = ThemeColors.buttonBorderColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        setShadow()
    }
}

