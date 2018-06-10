//
//  NetworkServices.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    
    let baseUrl: String = {
        return General.configuration["baseUrl"] as! String
    }()
    
    func get(url: String, completion: @escaping (HttpResponses, _ data: Data?) -> Void) {
        let url = baseUrl + url
        Alamofire.request(url).validate().responseJSON { response in
            guard response.result.isSuccess else {
                completion(.fail, nil)
                return
            }
            completion(.success, response.data)
        }
    }
}

enum HttpResponses {
    case fail
    case success
    case neutral
}
