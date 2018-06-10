//
//  ImageCollectionViewCell.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    func setup(imageUrl: String?) {
        if let image = imageUrl {
            picture.downloadedFrom(link: image)
        } else {
            picture.image = UIImage(named: General.placeholderImage)
        }
    }
}
