//
//  StoreListTest.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit
import XCTest
@testable import GreatGreen

class StoreListTest: XCTestCase {
    
    var apiMock: ApiServiceMock!
    var sut: ProductService!
    var parser: ParseServiceMock!
    
    override func setUp() {
        super.setUp()
        let decoder = JSONDecoder()
        apiMock = ApiServiceMock()
        parser = ParseServiceMock(decoder: decoder)
        sut = ProductService(api: apiMock, decoder: decoder, parser: parser,
                             productListObj: GeneralMock.productList, productDetailsObj: GeneralMock.productDetails)
        apiMock.requestPath = "/search?query=apple&page=1"
    }
    
    func testGetProductListResultSuccess() {
        setExpectation(description: "It Should result in the return product list")
        sut.getProducts(pageCount: 3, actualPage: 1, actualProductList: GeneralMock.productList.products!, completion: { (response, productList, pageCount, ActualPage) in
            XCTAssert(response == .success)
            XCTAssertNotNil(productList)
            XCTestCase.testExpectation.fulfill()
        })
        waitExpectations()
    }
    
    func testGetProductListResultFail() {
        setExpectation(description: "It Should result in fail response")
        apiMock.shouldFail = true
        sut.getProducts(pageCount: 3, actualPage: 1, actualProductList: GeneralMock.productList.products!, completion: { (response, productList, pageCount, ActualPage) in
            XCTAssert(response == .fail)
            XCTAssertNil(productList)
            XCTestCase.testExpectation.fulfill()
        })
        waitExpectations()
    }
    
    func testGetProductListResultNeutral() {
        setExpectation(description: "It Should result in neutral response as actual page is bigger than pageCount")
        apiMock.shouldFail = true
        sut.getProducts(pageCount: 1, actualPage: 2, actualProductList: GeneralMock.productList.products!, completion: { (response, productList, pageCount, ActualPage) in
            XCTAssert(response == .neutral)
            XCTAssertNil(productList)
            XCTestCase.testExpectation.fulfill()
        })
        waitExpectations()
    }
}
