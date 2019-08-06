//
//  PUIButton.swift
//  Ponderosa
//
//  Created by Joseph Lyons on 8/6/19.
//  Copyright © 2019 Joseph Lyons. All rights reserved.
//

import UIKit

class PUIButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleImageView()
    }

    private func styleImageView() {
        layer.cornerRadius = frame.height / 4

        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2

        setTitleColor(.black, for: .normal)
    }
}
