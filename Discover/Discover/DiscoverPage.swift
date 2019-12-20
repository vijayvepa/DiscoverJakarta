//
// Created by Vijay Vepakomma on 12/5/19.
// Copyright (c) 2019 Vijay Vepakomma. All rights reserved.
//

import UIKit
import SwipeViewFramework

class DiscoverPage: UICollectionViewCell {


    let headerBackground: UIImageView = UIImageView.named("HeaderBackground")
    let headerContainer: UIImageView = UIImageView.named("HeaderContainer")
    let contentContainer: UIImageView = UIImageView.namedNoClip("ContentContainer")

    let headerText: UITextView = {

        let textView = UITextView()

        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = UIColor(white: 0.2, alpha: 0)

        textView.contentInset = UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
        textView.attributedText = NSAttributedString.fromRichText(richText: [

            RichText(content: localized("Discover"), font: .systemFont(ofSize: 24), color: .white),
            RichText(content: localized("Jakarta"), font: .systemFont(ofSize: 16), color: .white)

        ])

        return textView
    }()

    let contentText: UITextView = {

        let textView = UITextView()

        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = UIColor(white: 0.2, alpha: 0)

        textView.contentInset = UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
        textView.attributedText = NSAttributedString.fromRichText(richText: [

            RichText(content: localized("Discover"), font: .systemFont(ofSize: 24), color: UIColor(hex:"#4A4A4A")),
            RichText(content: localized("Jakarta"), font: .systemFont(ofSize: 16), color: UIColor(hex:"#B2AAAA"))

        ])
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {


        addSubview(headerBackground)
        addSubview(headerContainer)

        addSubview(headerText)

        addSubview(contentContainer)

        headerBackground.anchor(top: self.topAnchor, heightConstant: self.frame.height * 0.4)
        headerContainer.anchor(top: self.topAnchor, heightConstant: self.frame.height * 0.4)
        headerText.anchor(top: self.topAnchor, left: self.leftAnchor, right: self
                .rightAnchor, topConstant: self.frame.height * 0.05, heightConstant: self.frame.height * 0.15)
        contentContainer.anchor(top: headerText.bottomAnchor, left:self.leftAnchor, bottom: self.bottomAnchor, right:
        self.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: -10, rightConstant: -10)


        self.backgroundColor = .white
    }

    private static func localized(_ text: String) -> String {
        return NSLocalizedString(text, comment: text)
    }

}

extension UIImageView {
    public static func named(_ named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: named)
        imageView.clipsToBounds = true //fix the flicker
        return imageView
    }

    public static func namedNoClip(_ named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: named)
        imageView.clipsToBounds = false //fix the flicker
        return imageView
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: alpha)
    }
}

extension NSAttributedString {

    static func fromRichText(richText: [RichText], paragraphStyle: Any? = nil) -> NSAttributedString {

        let attributedString: NSMutableAttributedString = NSMutableAttributedString()


        richText.forEach{text in
            let pageTitle: NSMutableAttributedString = NSMutableAttributedString(string: text.content,
                    attributes: [
                        NSAttributedString.Key.font: text.font,
                        NSAttributedString.Key.foregroundColor: text.color
                    ])
            attributedString.append(pageTitle)
        }

        if let paragraphStyle = paragraphStyle {

            attributedString.addAttribute(
                    NSAttributedString.Key.paragraphStyle,
                    value: paragraphStyle,
                    range: NSRange(location: 0, length: attributedString.string.count)
            )
        }else{
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            attributedString.addAttribute(
                    NSAttributedString.Key.paragraphStyle,
                    value: paragraphStyle,
                    range: NSRange(location: 0, length: attributedString.string.count)
            )
        }

        return attributedString

    }
}



