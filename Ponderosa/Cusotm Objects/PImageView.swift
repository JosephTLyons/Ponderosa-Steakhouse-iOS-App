//
//  PImageView.swift
//  Ponderosa
//
//  Created by Joseph Lyons on 8/6/19.
//  Copyright © 2019 Joseph Lyons. All rights reserved.
//

import UIKit

class PImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleImageView()
    }

    private func styleImageView() {
        contentMode = .scaleAspectFill
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
    }
}
