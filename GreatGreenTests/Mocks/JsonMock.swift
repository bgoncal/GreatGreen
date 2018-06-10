//
//  JsonMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class JsonMock {
    static let product = "{ " +
       " \"product\":  { " +
            " \"productId\": 785359," +
            " \"productName\": \"Fake Apple iPhone X id: 785359\"," +
            " \"productText\": \"<p>Met iPhone X.</p>\", " +
            " \"reviewInformation\": { " +
                    " \"reviewSummary\": { " +
                        " \"reviewAverage\": 9.2 " +
                    " } " +
                " }, " +
                " \"salesPriceIncVat\": 1249 " +
            " } " +
       "  }"
    
    static let productList = "{" +
        " \"products\": [{ " +
        " \"productId\": 785359, " +
        " \"productName\": \"Apple iPhone 6 32GB Grijs\", " +
        " \"reviewInformation\": { " +
        "     \"reviewSummary\": { " +
        "         \"reviewAverage\": 9.1 " +
        "     } " +
        "     }, " +
        " \"salesPriceIncVat\": 369, " +
        " \"productImage\": \"https://image.coolblue.nl/300x750/products/818870\" " +
        " }, " +
        "     { " +
        "         \"productId\": 793277, " +
        "         \"productName\": \"Apple iPhone X 64GB Space Gray\", " +
        "         \"reviewInformation\": { " +
        "             \"reviewSummary\": { " +
        "                 \"reviewAverage\": 9.2 " +
        "             } " +
        "         }, " +
        " \"salesPriceIncVat\": 1079, " +
        " \"productImage\": \"https://image.coolblue.nl/300x750/products/982902\" " +
        "     } " +
        "     ], " +
        "\"currentPage\": 1, " +
        "\"pageSize\": 24, " +
        "\"totalResults\": 70, " +
        "\"pageCount\": 3 " +
        "}"
}
