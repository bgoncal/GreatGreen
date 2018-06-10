//
//  UIViewController+Extension.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

extension UIViewController {
    
    @objc func showLoader() {
        HUD.show(.label("Loading..."))
    }
    
    @objc func hideLoader() {
        HUD.hide()
    }
    
    @objc func showError() {
        HUD.hide()
        HUD.flash(.label("Try Again"))
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
