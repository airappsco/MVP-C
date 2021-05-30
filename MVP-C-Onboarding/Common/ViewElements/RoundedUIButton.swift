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
                backgroundColor = .white
                setTitleColor(mainColor, for: .highlighted)
//                layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            } else {
                backgroundColor = mainColor
                titleLabel?.textColor = .white
//                layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            }
        }
    }
    
    private func setupButton() {
        titleLabel?.textColor = .white
        backgroundColor = mainColor
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
        setShadow()
    }
}

