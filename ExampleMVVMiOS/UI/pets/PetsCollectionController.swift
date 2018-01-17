//
//  PetsCollectionController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

private let petCellId = "PetCell"

class PetsCollectionController: BaseCollectionController, ControllerContract {
    
    lazy var petsViewModel: PetsViewModelRepresentable = {
        return PetsViewModel(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
        changeTitle(title: "Pets")
        registerCell(cellClass: PetCell.self, identifier: petCellId)
        petsViewModel.loadPets(status: "sold")
    }
}

extension PetsCollectionController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petsViewModel.numberOfItemsInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: petCellId, for: indexPath) as! PetCell
        cell.pet = petsViewModel.getPet(indexPath: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PetDetailController()
        controller.pet = petsViewModel.getPet(indexPath: indexPath)
        navigationController?.viewControllers += [controller]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
}

extension PetsCollectionController: PetsViewModelDelegate {
    
    func reloadCollectionView(){
        collectionView?.reloadData()
    }
    
    func updateLoadingStatus(status: Bool){
        changeStatusLoading(animate: status)
    }
    
    func showError(message: String){
        print(message)
    }
}

extension PetsCollectionController {
    static func newInstance() -> PetsCollectionController{
        return PetsCollectionController(collectionViewLayout: UICollectionViewFlowLayout())
    }
}
