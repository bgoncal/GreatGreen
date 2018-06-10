//
//  XCTestCase+Extension.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    static var testExpectation = XCTestExpectation(description: "Expectation Initialized")
    
    func setExpectation(description: String) {
        XCTestCase.testExpectation = XCTestExpectation(description: description)
    }
    
    func waitExpectations() {
        wait(for: [XCTestCase.testExpectation], timeout: 10.0)
    }
}
