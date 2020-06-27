//
//  UIHelper.swift
//  Cayenne
//
//  Created by Wellington Johnson on 6/26/20.
//  Copyright © 2020 Wellington Johnson. All rights reserved.
//

import UIKit

struct UIHelper {
    static func createRecipeCollectionViewLayout(in view: UIView) -> UICollectionViewLayout {
         //1
         let itemSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(1.0),
           heightDimension: .fractionalHeight(0.2)
        )
         let fullRecipeItem = NSCollectionLayoutItem(layoutSize: itemSize)
         //2
         let groupSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(1.0),
           heightDimension: .fractionalHeight(0.2)
        )
         let group = NSCollectionLayoutGroup.horizontal(
           layoutSize: groupSize,
           subitem: fullRecipeItem,
           count: 1
        )
         //3
         let section = NSCollectionLayoutSection(group: group)
         let layout = UICollectionViewCompositionalLayout(section: section)
         return layout
    }
}
