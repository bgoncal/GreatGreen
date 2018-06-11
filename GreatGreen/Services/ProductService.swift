//
//  ProductsServices.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ProductService {
    
    let api: ApiService
    let decoder: JSONDecoder
    let productPath = "/product/"
    let productsListPath = "/search?query=apple&page="
    let parser: ParseService
    let productListObj: ProductList
    let productDetailsObj: ProductDetails
    
    init(api: ApiService, decoder: JSONDecoder, parser: ParseService, productListObj: ProductList, productDetailsObj: ProductDetails) {
        self.api = api
        self.decoder = decoder
        self.parser = parser
        self.productListObj = productListObj
        self.productDetailsObj = productDetailsObj
    }
    
    // MARK: - Product List
    func getProducts(pageCount: Int, actualPage: Int, actualProductList: [ProductList.Product],
                     completion: @escaping (HttpResponses, [ProductList.Product]?, _ pageCount: Int, _ actualPage: Int) -> Void) {
        
        var actualProductList = actualProductList
        
        if actualPage > pageCount {
            completion(.neutral, nil, pageCount, actualPage)
            return
        }
        api.get(url: String(productsListPath + String(actualPage))) { (response, data) in
            if let productsList = self.parser.parse(data: data, objectType: self.productListObj), response != .fail {
                actualProductList += productsList.products!
                completion(.success, actualProductList, productsList.pageCount ?? 1, actualPage + 1)
                return
            } else {
                completion(.fail, nil, pageCount, actualPage)
            }
        }
    }
    
    // MARK: - Product Details
    func getProductDetails(productId: Int, completion: @escaping (HttpResponses, ProductList.Product?) -> Void) {
        api.get(url: productPath + String(productId)) { (response, data) in
            if let productDetails = self.parser.parse(data: data, objectType: self.productDetailsObj), response != .fail {
                completion(.success, productDetails.product)
            } else {
                completion(.fail, nil)
            }
        }
    }
}
