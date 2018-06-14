//
//  StoreListViewModelTest.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import XCTest
@testable import GreatGreen

class StoreListViewModelTest: XCTestCase {
    
    var productServiceMock: ProductServiceMock!
    var apiMock: ApiServiceMock!
    var parser: ParseServiceMock!
    var viewControllerMock: StoreListViewControllerMock!
    var sut: StoreListViewModel!
    
    override func setUp() {
        super.setUp()
        let decoder = JSONDecoder()
        apiMock = ApiServiceMock()
        parser = ParseServiceMock(decoder: decoder)
        productServiceMock = ProductServiceMock(api: apiMock, decoder: decoder, parser: parser,
                                        productListObj: GeneralMock.productList, productDetailsObj: GeneralMock.productDetails)
        viewControllerMock = StoreListViewControllerMock()
        sut = StoreListViewModel(productService: productServiceMock, products: [Product](), delegate: viewControllerMock)
    }
    
    func testGetProductsStartShouldShowLoader() {
        sut.getProductsPaginated()
        XCTAssert(viewControllerMock.didShowLoader)
    }
    
    func testGetProductsEndShouldHideLoader() {
        sut.getProductsPaginated()
        XCTAssert(viewControllerMock.didHideLoader)
    }
    
    func testGetProductsEndFailingShouldShowError() {
        productServiceMock.shouldFail = true
        sut.getProductsPaginated()
        XCTAssert(viewControllerMock.didShowError)
    }
    
    func testGetProductsEndSuccessHaveProductNotNill() {
        sut.getProductsPaginated()
        XCTAssertNotNil(sut.products)
        XCTAssertNotNil(sut.filteredProducts)
    }
    
    func testGetProductsEndSuccessReturnProducts() {
        sut.getProductsPaginated()
        XCTAssert(sut.products.count > 0)
        XCTAssert(sut.filteredProducts.count > 0)
    }
    
    func testGetProductsEndFailingHaveNoProducts() {
        productServiceMock.shouldFail = true
        sut.getProductsPaginated()
        XCTAssert(sut.products.count == 0)
        XCTAssert(sut.filteredProducts.count == 0)
    }
}
