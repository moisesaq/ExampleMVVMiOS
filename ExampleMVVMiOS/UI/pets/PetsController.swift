//
//  PetsCollectionController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

private let petCellId = "PetCell"

class PetsController: BaseCollectionController, ControllerContract {

    var pets: [Pet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        changeTitle(title: "Pets")
        registerCell(cellClass: PetCell.self, identifier: petCellId)
        
        ServiceManager.sharedInstance.getPetsByStatus(status: "pending", completion: { (pets) in
            self.pets += pets
            self.collectionView?.reloadData()
            self.stopLoading()
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
}

extension PetsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: petCellId, for: indexPath) as! PetCell
        cell.pet = pets[indexPath.item]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(pets[indexPath.item].name as Any)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
}

extension PetsController {
    static func newInstance() -> PetsController{
        return PetsController(collectionViewLayout: UICollectionViewFlowLayout())
    }
}
