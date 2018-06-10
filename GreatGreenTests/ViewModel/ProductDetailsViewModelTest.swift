//
//  ProductDetailsViewModelTest.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import XCTest
@testable import GreatGreen

class ProductDetailsViewModelTest: XCTestCase {

    var productServiceMock: ProductServiceMock!
    var apiMock: ApiServiceMock!
    var parser: ParseServiceMock!
    var viewControllerMock: ProductDetailsViewControllerMock!
    var sut: ProductDetailsViewModel!
    let productId = GeneralMock.productId
    
    override func setUp() {
        super.setUp()
        let decoder = JSONDecoder()
        apiMock = ApiServiceMock()
        parser = ParseServiceMock(decoder: decoder)
        productServiceMock = ProductServiceMock(api: apiMock, decoder: decoder, parser: parser,
                                                productListObj: GeneralMock.productList, productDetailsObj: GeneralMock.productDetails)
        viewControllerMock = ProductDetailsViewControllerMock()
        sut = ProductDetailsViewModel(product: GeneralMock.product, productService: productServiceMock, delegate: viewControllerMock)
    }
    
    func testGetProductsStartShouldShowLoader() {
        sut.getProductDetail(productId: productId)
        XCTAssert(viewControllerMock.didShowLoader)
    }
    
    func testGetProductsEndShouldHideLoader() {
        sut.getProductDetail(productId: productId)
        XCTAssert(viewControllerMock.didHideLoader)
    }
    
    func testGetProductsEndFailingShouldShowError() {
        productServiceMock.shouldFail = true
        sut.getProductDetail(productId: productId)
        XCTAssert(viewControllerMock.didShowError)
    }
    
    func testGetProductsEndSuccessHaveProductNotNill() {
        sut.getProductDetail(productId: productId)
        XCTAssertNotNil(sut.product)
    }
    
    func testGetProductsEndSuccessReturnProducts() {
        sut.getProductDetail(productId: productId)
        XCTAssert(sut.product.productId == GeneralMock.productId)
    }
    
    func testGetProductsEndFailingHaveProductWithNoProductText() {
        productServiceMock.shouldFail = true
        sut.getProductDetail(productId: productId)
        XCTAssertNil(sut.product.productText)
    }
}
