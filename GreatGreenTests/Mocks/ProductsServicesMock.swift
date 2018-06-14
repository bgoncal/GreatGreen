//
//  ProductsServicesMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
@testable import GreatGreen

class ProductServiceMock: ProductService {
    
    var shouldFail = false
    
    override func getProductDetails(productId: Int, completion: @escaping (HttpResponses, Product?) -> Void) {
        if shouldFail {
            completion(.fail, nil)
        } else {
            completion(.success, GeneralMock.productDetails.product)
        }
    }
    
    override func getProducts(pageCount: Int, actualPage: Int, actualProductList: [Product], completion: @escaping (HttpResponses, [Product]?, Int, Int) -> Void) {
        if shouldFail {
            completion(.fail, nil, 1, 1)
        } else {
            completion(.success, GeneralMock.productList.products, 1, 1)
        }
    }
   
}
