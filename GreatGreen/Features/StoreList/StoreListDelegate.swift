//
//  StoreListDelegate.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

protocol StoreListDelegate {
    func showLoader()
    func hideLoader()
    func reloadCollection()
    func showError()
}
