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

    var mealText: [String] = [
        "7 oz Sirloin",
        "Salmon",
        "Tilapia",
        "Chicken Strips",
        "Chop",
        "Shrimp Skewer",
        "Burger",
        "Wings"
    ]

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
        for i in mealText {
            meals.append(
                Meal(
                    mealName: i,
                    mealImage: UIImage(named: i),
                    mealDescription: "Temp text for now"

                )
            )
        }
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

        print(meals[indexPath.item])
    }
}
