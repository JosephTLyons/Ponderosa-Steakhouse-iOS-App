//
//  MealDescriptionViewController.swift
//  Ponderosa
//
//  Created by Joseph Lyons on 8/6/19.
//  Copyright © 2019 Joseph Lyons. All rights reserved.
//

import UIKit

class MealDescriptionViewController: UIViewController {
    @IBOutlet weak var largeMealImageView: UIImageView!
    @IBOutlet weak var mealDescriptionTextView: UITextView!

    var meal: Meal? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        largeMealImageView.image = meal?.mealImage
        mealDescriptionTextView.text = meal?.mealDescription
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
