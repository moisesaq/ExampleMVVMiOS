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
        loadPets(status: "pending")
        addFilterTabBarItem()
    }
    
    private func loadPets(status: String){
        petsViewModel.loadPets(status: status)
    }
    
    private func addFilterTabBarItem(){
        let filterBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_filter"), style: .plain, target: self, action: #selector(handleFilter))
        navigationItem.rightBarButtonItem = filterBarButtonItem
    }
    
    @objc func handleFilter(){
        showAlertFilter()
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
        //testEncode(pet: petsViewModel.getPet(indexPath: indexPath))
    }
    
    private func testEncode(pet: Pet){
        do {
            let parser = PetParser().postItem(item: pet)
            let data = try JSONEncoder().encode(parser)
            print(String(data: data, encoding: .utf8)!)
        } catch let error{
            print(error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
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

extension PetsCollectionController {
    
    private func showAlertFilter(){
        let alert = UIAlertController(title: "Select status", message: nil, preferredStyle: .actionSheet)
        let pendingAction = UIAlertAction(title: "Pending", style: .default) { (action) in
            self.loadPets(status: "pending")
        }
        let soldAction = UIAlertAction(title: "Sold", style: .default) { (action) in
            self.loadPets(status: "sold")
        }
        let availableAction = UIAlertAction(title: "Available", style: .default) { (action) in
            self.loadPets(status: "available")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(pendingAction)
        alert.addAction(soldAction)
        alert.addAction(availableAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
