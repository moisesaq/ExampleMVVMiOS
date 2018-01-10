//
//  PetsCollectionController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PetsController: BaseCollectionController, ControllerContract {

    static func newInstance() -> PetsController{
        return PetsController(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func setUp() {
        changeTitle(title: "Pets moises")
        registerCell(cellClass: UICollectionViewCell.self, identifier: reuseIdentifier)
    }
}
