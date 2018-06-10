//
//  ParseServiceMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
@testable import GreatGreen

class ParseServiceMock: ParseService {
    override func parse<T>(data: Data?, objectType: T) -> T? where T : Decodable, T : Encodable {
        return objectType
    }
}
