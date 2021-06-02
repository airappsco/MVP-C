//
//  StandardUILabel.swift
//  MVP-C-Onboarding
//
//  Created by David on 30/05/2021.
//

import UIKit

enum FontStyle {
    case bold
    case thin
    case italic
}

final class StandardUILabel: UILabel {

    init(text: String = "", fontSize: CGFloat = 20, fontStyle: FontStyle = .bold, alignment: NSTextAlignment = .left, textColor: UIColor = ColorSupport.systemGray, multiline: Bool = true) {
        super.init(frame: .zero)

        switch fontStyle {
        case .bold:
            font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Bold", size: fontSize)!)
        case .thin:
            font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Light", size: fontSize)!)
        case .italic:
            font = UIFontMetrics(forTextStyle: UIFont.TextStyle.body).scaledFont(for: UIFont(name: "Helvetica-Oblique", size: fontSize)!)
        }

        self.textColor = textColor
        self.text = text
        numberOfLines = multiline ? 0 : 1
        textAlignment = alignment
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
