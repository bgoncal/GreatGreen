//
//  CustomImageFlowLayout.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    var numberOfColumns: Float = 2
    
    override init() {
        super.init()
        setupLayout()
    }
    
    func setup(numberOfColumns: Float) {
        self.numberOfColumns = numberOfColumns
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {}
        get {
            if let collectionView = self.collectionView {
                let itemWidth = CGFloat((Float(collectionView.frame.width) - (numberOfColumns - 1)) / numberOfColumns)
                return CGSize(width: itemWidth, height: itemWidth)
            }
            return CGSize()
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }
}
