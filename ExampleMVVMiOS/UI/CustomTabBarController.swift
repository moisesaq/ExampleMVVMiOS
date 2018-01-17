//
//  CustomTabBarController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 17/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        let navMainController = MainNavigationController()
        navMainController.title = "Pets"
        
        let searchController = SearchController()
        searchController.title = "Search"
        viewControllers = [navMainController, searchController]
    }
}
