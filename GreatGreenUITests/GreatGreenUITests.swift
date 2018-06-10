//
//  GreatGreenUITests.swift
//  GreatGreenUITests
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import XCTest

class GreatGreenUITests: XCTestCase {
    
    let app = XCUIApplication()
    let searchBarPlaceholder = "Search..."
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testUserSearchForAUniqueProductAndSeeItDetailsSuccessfully() {
        sleep(5)
        let searchBar = app.searchFields[searchBarPlaceholder]
        searchBar.tap()
        searchBar.typeText("Airpods")
        
        let collectionView = app.collectionViews
        app.tap()
        XCTAssert(collectionView.cells.count == 1)
        collectionView.cells.children(matching: .other).element.children(matching: .other).element.tap()
        sleep(2)
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.firstMatch.swipeUp()
        elementsQuery.buttons["Add to cart"].tap()
        elementsQuery.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.swipeDown()
        elementsQuery.buttons["X"].tap()
    }
    
    func testUserSearchForAGroupOfFourProductsAndSeeDetailsOfLastSuccessfully() {
        sleep(5)
        let searchBar = app.searchFields[searchBarPlaceholder]
        searchBar.tap()
        searchBar.typeText("Lightning")
        
        let collectionView = app.collectionViews
        app.tap()
        XCTAssert(collectionView.cells.count == 2)
        collectionView.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.tap()
        sleep(2)
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.firstMatch.swipeUp()
        elementsQuery.buttons["Add to cart"].tap()
        elementsQuery.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.swipeDown()
        elementsQuery.buttons["X"].tap()
    }
    
    func testUserTapOnAProductAndClickOnCloseButtonClosingTheDetails() {
        sleep(5)
        let collectionView = app.collectionViews
        collectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        sleep(2)
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["X"].tap()
    }
    
    func testUserTapOnAProductAndClickOnAddToCartButtonClosing() {
        sleep(5)
        let collectionView = app.collectionViews
        collectionView.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.tap()
        sleep(2)
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.firstMatch.swipeUp()
        elementsQuery.buttons["Add to cart"].tap()
    }
}
