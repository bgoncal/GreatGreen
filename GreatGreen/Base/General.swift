//
//  General.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class General {
    static let configuration: NSDictionary = {
        if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"),
            let config = NSDictionary(contentsOfFile: path) {
            return config
        }
        return NSDictionary()
    }()
    
    static let currency: String = {
        return General.configuration["currency"] as! String
    }()
    
    static let placeholderImage = "placeholder"
    
    static let productDetailsMock = ProductDetails.self(product: ProductList.Product(productId: 0, productName: "",
                                                                                     productText: nil, productImage: nil,
                                                                                     reviewInformation: nil, productImages: nil,
                                                                                     salesPriceIncVat: 0.0))
    
    static let productListMock = ProductList.self(currentPage: 0, pageSize: 0, totalResults: 0, pageCount: 0, products: [ProductList.Product]())
}
