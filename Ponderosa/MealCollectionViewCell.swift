//
//  mealCollectionViewCell.swift
//  Ponderosa
//
//  Created by Joseph Lyons on 7/21/19.
//  Copyright © 2019 Joseph Lyons. All rights reserved.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        styleImageView()
    }

    private func styleImageView() {
        mealImageView.contentMode = .scaleAspectFill
        mealImageView.layer.borderWidth = 2
        mealImageView.layer.borderColor = UIColor.black.cgColor
    }
}
