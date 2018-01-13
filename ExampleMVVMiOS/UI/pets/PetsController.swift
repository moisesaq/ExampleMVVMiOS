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
        //setUpViewModel()
    }
    
    func setUpViewModel(){
        /*petsViewModel.updateLoadingStatus = { [weak self] (status) in
            if !status {
                self?.stopLoading()
            }
        }
        
        petsViewModel.reloadCollectionView = { [weak self] () in
            self?.collectionView?.reloadData()
        }*/
        
        petsViewModel.loadPets(status: "pending")
    }
}

extension PetsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petsViewModel.numberOfItemsInSection()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: petCellId, for: indexPath) as! PetCell
        cell.pet = petsViewModel.getPet(indexPath: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(petsViewModel.getPet(indexPath: indexPath).name as Any)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 90)
    }
}

extension PetsController: PetsViewModelDelegate{
    
    func reloadCollectionView(){
        collectionView?.reloadData()
    }
    
    func updateLoadingStatus(status: Bool){
        if !status {
            stopLoading()
        }
    }
    
    func showError(message: String){
        print(message)
    }
}

extension PetsController {
    static func newInstance() -> PetsController{
        return PetsController(collectionViewLayout: UICollectionViewFlowLayout())
    }
}
