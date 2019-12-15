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

    let textView: UITextView = {

        let textView = UITextView()

        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = UIColor(white: 0.2, alpha: 0)

        textView.contentInset = UIEdgeInsets(top: 24, left: 16, bottom: 0, right: 16)
        textView.attributedText = getText(title: "DISCOVER", message: "JAKARTA, INDONESIA")
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

        addSubview(textView)

        addSubview(contentContainer)

        headerBackground.anchor(top: self.topAnchor, heightConstant: self.frame.height * 0.4)
        headerContainer.anchor(top: self.topAnchor, heightConstant: self.frame.height * 0.4)
        textView.anchor(top: self.topAnchor, left: self.leftAnchor, right: self
                .rightAnchor, topConstant: self.frame.height * 0.05, heightConstant: self.frame.height * 0.15)
        contentContainer.anchor(top: textView.bottomAnchor, left:self.leftAnchor, bottom: self.bottomAnchor, right:
        self.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: -10, rightConstant: -10)


        self.backgroundColor = .white
    }


    private static func getText(title: String, message: String) -> NSMutableAttributedString {

        let color: UIColor = .white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center


        let pageTitle: NSMutableAttributedString = NSMutableAttributedString(string: title,
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.medium),
                    NSAttributedString.Key.foregroundColor: color

                ])

        let pageMessage: NSMutableAttributedString = NSMutableAttributedString(string: "\n\n\(message)",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium),
                    NSAttributedString.Key.foregroundColor: color
                ])

        pageTitle.append(pageMessage)

        pageTitle.addAttribute(
                NSAttributedString.Key.paragraphStyle,
                value: paragraphStyle,
                range: NSRange(location: 0, length: pageTitle.string.count)
        )

        return pageTitle

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




