//
//  StoreListViewModelMock.swift
//  GreatGreenTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 10/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import UIKit
@testable import GreatGreen

class StoreListViewControllerMock: StoreListViewController {
    
    var didShowError = false
    var didShowLoader = false
    var didHideLoader = false
    
    override func showError() {
        didShowError = true
    }
    
    override func showLoader() {
        didShowLoader = true
    }
    
    override func hideLoader() {
        didHideLoader = true
    }
    
    override func reloadCollection() {
    
    }
}
