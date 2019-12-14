//
// Created by Vijay Vepakomma on 12/5/19.
// Copyright (c) 2019 Vijay Vepakomma. All rights reserved.
//

import UIKit
import SwipeViewFramework

class DiscoverPage: UICollectionViewCell {

    let headerBackground: UIImageView = {

        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
        iv.image = UIImage(named: "HeaderBackground")
        iv.clipsToBounds = true //fix the flicker
        return iv
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
        headerBackground.anchor(top: self.topAnchor, heightConstant: self.frame.height * 0.4)
        self.backgroundColor = .red
    }
}
