//
//  File.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

protocol ProductDetailsDelegate {
    func reloadCollection()
    func showLoader()
    func hideLoader()
    func showError()
}
