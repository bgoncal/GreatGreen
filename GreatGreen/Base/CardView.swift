//
//  CardView.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
    override func awakeFromNib() {
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5.0
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 15
    }
    
}
