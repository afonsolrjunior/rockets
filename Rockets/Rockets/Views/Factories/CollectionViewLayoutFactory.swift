//
//  CollectionViewLayoutFactory.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 06/02/2023.
//

import UIKit

final class CollectionViewLayoutFactory {
    
    static func makeCardsLayout(cardsPerLine: Int = 3) -> UICollectionViewLayout {
        let numbersOfCardsPerLine = CGFloat(cardsPerLine)
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / numbersOfCardsPerLine), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / numbersOfCardsPerLine))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: cardsPerLine)
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    static func makeListLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
    
}
