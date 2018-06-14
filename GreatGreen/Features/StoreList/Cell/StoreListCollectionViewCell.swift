//
//  StoreListCollectionViewCell.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class StoreListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    let currency = General.currency
    
    func setup(product: Product) {
        productName.text = product.productName
        if let image = product.productImage {
            productImage.downloadedFrom(link: image)
        }
        productPrice.text = currency + String(product.salesPriceIncVat)
    }
}
