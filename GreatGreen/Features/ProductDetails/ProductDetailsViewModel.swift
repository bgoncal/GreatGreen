//
//  ProductDetailsViewModel.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ProductDetailsViewModel {

    var product: Product
    let productService: ProductService
    let delegate: ProductDetailsDelegate
    let currency = General.currency
    
    init(product: Product, productService: ProductService, delegate: ProductDetailsDelegate) {
        self.product = product
        self.productService = productService
        self.delegate = delegate
    }
    
    func getPrice() -> String {
        return currency + String(product.salesPriceIncVat)
    }
    
    func getProductDetail(productId: Int) {
        self.delegate.showLoader()
        productService.getProductDetails(productId: productId) { (response, product) in
            if response == .success, let product = product {
                self.product = product
                self.delegate.reloadCollection()
                self.delegate.hideLoader()
            } else if response == .fail {
                self.delegate.showError()
            } else {
                self.delegate.hideLoader()
            }
        }
    }
    
}
