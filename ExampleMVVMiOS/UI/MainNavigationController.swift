//
//  MainNavigationController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        //viewControllers = [PetsController.newInstance()]
        viewControllers.append(PetsCollectionController.newInstance())
    }
    
    override func show(_ vc: UIViewController, sender: Any?) {
        super.show(vc, sender: sender)
        print("Controllers >>> \(String(describing: self.viewControllers.count))")
    }
}
