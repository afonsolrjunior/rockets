//
//  CollectionViewDataProvider.swift
//  Rockets
//
//  Created by Afonso Rodrigues (Contractor) on 02/02/2023.
//

import UIKit

class CollectionViewDataProvider<T: Hashable> {
    private(set) var items: [T] = [] {
        didSet {
            updateSnapShot()
        }
    }
    
    private let collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func updateSnapShot() {
        collectionView.reloadData()
    }
    
}
