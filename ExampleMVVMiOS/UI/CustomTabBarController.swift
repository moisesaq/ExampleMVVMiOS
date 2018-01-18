//
//  CustomTabBarController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 17/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class CustomTabBarController: RAMAnimatedTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        let animation = RAMFumeAnimation()
        animation.textSelectedColor = UIColor.primary
        animation.iconSelectedColor = UIColor.primary
        
        let navMainController = MainNavigationController()
        let tabBarItemPets = RAMAnimatedTabBarItem(title: "Pets", image: #imageLiteral(resourceName: "ic_pet"), selectedImage: #imageLiteral(resourceName: "ic_pet_selected"))
        tabBarItemPets.animation = animation
        navMainController.tabBarItem = tabBarItemPets
        
        let searchController = SearchController()
        let tabBarItemSearch = RAMAnimatedTabBarItem(title: "Search", image: #imageLiteral(resourceName: "ic_search"), selectedImage: #imageLiteral(resourceName: "ic_search_selected"))
        tabBarItemSearch.animation = animation
        searchController.tabBarItem = tabBarItemSearch
        viewControllers = [navMainController, searchController]
    }
}
