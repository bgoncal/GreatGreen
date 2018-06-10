//
//  ProductServiceTest.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import XCTest
@testable import GreatGreen

class ProductDetailsTest: XCTestCase {
    
    var apiMock: ApiServiceMock!
    var sut: ProductService!
    var parser: ParseServiceMock!
    
    override func setUp() {
        super.setUp()
        let decoder = JSONDecoder()
        apiMock = ApiServiceMock()
        parser = ParseServiceMock(decoder: decoder)
        apiMock.requestPath = ""
        apiMock.shouldFail = false
        sut = ProductService(api: apiMock, decoder: decoder, parser: parser,
                             productListObj: GeneralMock.productList, productDetailsObj: GeneralMock.productDetails)
    }
    
    func testGetProductDetailResultSuccess() {
        setExpectation(description: "It should result in the return of 1 product with id 785359")
        let productId  = GeneralMock.productId
        apiMock.requestPath = "/product/"
        sut.getProductDetails(productId: productId) { (response, product) in
            XCTAssert(productId == product?.productId)
            XCTestCase.testExpectation.fulfill()
        }
        waitExpectations()
    }
    
    func testGetProductDetailReturnNoProduct() {
        setExpectation(description: "It should return fail response")
        let productId = 0
        apiMock.shouldFail = true
        sut.getProductDetails(productId: productId) { (response, product) in
            XCTAssert(response == .fail)
            XCTestCase.testExpectation.fulfill()
        }
        waitExpectations()
    }
    
    func testGetProductDetailReturnProductWithNameAndId() {
        setExpectation(description: "It should result in the return of 1 product with id 785359 and Name Fake Apple iPhone X id: 785359")
        let productId = GeneralMock.productId
        apiMock.requestPath = "/product/"
        sut.getProductDetails(productId: productId) { (response, product) in
            XCTAssert(productId == product?.productId)
            XCTAssert("Fake Apple iPhone X id: 785359" == product?.productName)
            XCTestCase.testExpectation.fulfill()
        }
        waitExpectations()
    }
}
