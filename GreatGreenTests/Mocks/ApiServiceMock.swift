//
//  NetworkServicesMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
@testable import GreatGreen

class ApiServiceMock: ApiService {
    
    var data = Data()
    var requestPath = ""
    var shouldFail = false
    
    override func get(url: String, completion: @escaping (HttpResponses, Data) -> Void) {
        if shouldFail {
            completion(.fail, Data())
            return
        }
        if url.contains(requestPath) {
            let productJsonMock = JsonMock.product
            data = productJsonMock.data(using: .utf8)!
            completion(.success, data)
        } else {
            let productListJsonMock = JsonMock.productList
            data = productListJsonMock.data(using: .utf8)!
            completion(.success, data)
        }
    }
    
}
