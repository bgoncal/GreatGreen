//
//  JsonService.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ParseService {
    
    let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func parse<T: Codable>(data: Data, objectType: T) -> T? {
        guard let data = String(data: data, encoding: .utf8), let jsonData = data.data(using: .utf8) else {
            return nil
        }
        do {
            let obj = try self.decoder.decode(T.self, from: jsonData)
            return obj
        } catch (let err) {
            print(err)
        }
        return nil
    }
}
