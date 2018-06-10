//
//  ProductList.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

struct ProductList: Codable {
    
    let currentPage: Int?
    let pageSize: Int?
    let totalResults: Int?
    let pageCount: Int?
    let products: [Product]?
    
    struct Product: Codable {
        let productId: Int
        let productName: String
        let productText: String?
        let productImage: String?
        let reviewInformation: ReviewInformation?
        let productImages: [String]?
        let salesPriceIncVat: Float
        
        enum CodingKeys : String, CodingKey {
            case productId
            case productName
            case productText
            case productImage
            case reviewInformation
            case productImages
            case salesPriceIncVat
        }
        
        struct ReviewInformation: Codable {
            let reviewSummary: ReviewSummary
            
            enum CodingKeys : String, CodingKey {
                case reviewSummary
            }
            
            struct ReviewSummary: Codable {
                let reviewAverage: Double
            }
        }
    }
    
    enum CodingKeys : String, CodingKey {
        case currentPage
        case pageSize
        case totalResults
        case pageCount
        case products
    }
}

struct ProductDetails: Codable {
    let product: ProductList.Product?
    
    enum CodingKeys : String, CodingKey {
        case product
    }
}
