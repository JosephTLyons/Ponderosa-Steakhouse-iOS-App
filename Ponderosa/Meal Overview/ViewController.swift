//
//  ViewController.swift
//  Ponderosa
//
//  Created by Joseph Lyons on 7/16/19.
//  Copyright © 2019 Joseph Lyons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "mealCollectionViewCell"

    var meals: [Meal] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
        addMealsToMealArray()
    }

    private func addMealsToMealArray() {
        meals.append(
            Meal(mealName: "7 oz Sirloin",
                 mealImage: UIImage(named: "7 oz Sirloin"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Salmon",
                 mealImage: UIImage(named: "Salmon"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Tilapia",
                 mealImage: UIImage(named: "Tilapia"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Chicken Strips",
                 mealImage: UIImage(named: "Chicken Strips"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Chop Steak",
                 mealImage: UIImage(named: "Chop"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Shrimp Skewer",
                 mealImage: UIImage(named: "Shrimp Skewer"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Burger",
                 mealImage: UIImage(named: "Burger"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "Wings",
                 mealImage: UIImage(named: "Wings"),
                 mealDescription: "Our signature, savory wings.  Drummies or wings? You are in control of your fate!"
            )
        )

        meals.append(
            Meal(mealName: "Prime Rib",
                 mealImage: UIImage(named: "Prime Rib"),
                 mealDescription: "MMMMM"
            )
        )

        meals.append(
            Meal(mealName: "10 oz Ribeye",
                 mealImage: UIImage(named: "Ribeye"),
                 mealDescription: "MMMMM"
            )
        )
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "MealCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemsPerRow: CGFloat = 3
            let lineSpacing: CFloat = 5
            let interItemSpacing: CGFloat = 10

            let width = (collectionView.frame.width - (numberOfItemsPerRow - 1) * interItemSpacing) / numberOfItemsPerRow
            let height = width

            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = CGFloat(lineSpacing)
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meals.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MealCollectionViewCell

        cell.mealImageView.image = meals[indexPath.item].mealImage
        cell.mealLabel.text = meals[indexPath.item].mealName

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mealDescriptionVC") as? MealDescriptionViewController {
            vc.meal = meals[indexPath.item]
            present(vc, animated: true, completion: nil)
        }
    }
}
