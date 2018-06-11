//
//  StoreListViewModel.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class StoreListViewModel {
    
    let productService: ProductService
    var products: [ProductList.Product]
    var filteredProducts: [ProductList.Product]
    let delegate: StoreListDelegate
    var pageCount = 1
    var actualPage = 1
    
    init(productService: ProductService, products: [ProductList.Product], delegate: StoreListDelegate) {
        self.productService = productService
        self.products = products
        self.delegate = delegate
        self.filteredProducts = products
    }
    
    // MARK: - Products
    func getProductsPaginated() {
        delegate.showLoader()
        productService.getProducts(pageCount: pageCount, actualPage: actualPage, actualProductList: products) { (response, productList, pageCount, actualPage) in
            if response == .success, let productList = productList {
                self.products = productList
                self.filteredProducts = self.products
                self.actualPage = actualPage
                self.pageCount = pageCount
                self.delegate.reloadCollection()
                self.delegate.hideLoader()
            } else if response == .fail {
                self.delegate.showError()
            } else {
                self.delegate.hideLoader()
            }
        }
    }
    
    // MARK: - Filter
    func filterProducts(query: String) {
        if query.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter({ (product) -> Bool in
                return (product.productName.lowercased().range(of: query.lowercased()) != nil)
            })
        }
        delegate.reloadCollection()
    }
}
