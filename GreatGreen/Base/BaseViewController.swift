//
//  BaseViewController.swift
//  GreatGreen
//
//  Created by Bruno Pantaleão N. Gonçalves on 08/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupBarStyle()
    }
    
    // MARK: - Style
    func setupBarStyle() {
        let navBar = navigationController?.navigationBar
        let navBarTextAttr = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navBar?.isTranslucent = false
        navBar?.prefersLargeTitles = true
        navBar?.tintColor = UIColor.white
        navBar?.barTintColor = UIColor.base
        navBar?.titleTextAttributes = navBarTextAttr
        navBar?.largeTitleTextAttributes = navBarTextAttr
    }
}
