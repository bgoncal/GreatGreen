//
//  GeneralMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
@testable import GreatGreen

class GeneralMock: General {
    
    static let product = Product(productId: 785359, productName: "Fake Apple iPhone X id: 785359",
                                             productText: nil, productImage: nil,
                                             reviewInformation: nil, productImages: nil,
                                             salesPriceIncVat: 0.0)
    
    static let productDetails = ProductDetails.self(product: GeneralMock.product)
    
    static let productList = ProductList.self(currentPage: 0, pageSize: 0, totalResults: 0, pageCount: 0, products: [GeneralMock.product])
    
    static let productId = 785359
}
