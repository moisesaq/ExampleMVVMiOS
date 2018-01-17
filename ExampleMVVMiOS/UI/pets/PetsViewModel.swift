//
//  PetsViewModel.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 11/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class PetsViewModel: PetsViewModelRepresentable{    
    let serviceManger: ServiceContract
    var delegate: PetsViewModelDelegate?
    
    private var pets: [Pet] = [] {
        didSet{
            delegate?.reloadCollectionView()
        }
    }
    
    init(service: ServiceContract! = ServiceManager()) {
        serviceManger = service
    }
    
    init(service: ServiceContract! = ServiceManager(), delegate: PetsViewModelDelegate) {
        serviceManger = service
        self.delegate = delegate
    }
    
    func loadPets(status: String) {
        delegate?.updateLoadingStatus(status: true)
        ServiceManager.sharedInstance.getPetsByStatus(status: status, completion: { (pets) in
            self.delegate?.updateLoadingStatus(status: false)
            self.pets += pets
        }) { (errorMessage) in
            self.delegate?.showError(message: "Error :(")
            print(errorMessage)
        }
    }
    
    func numberOfItemsInSection() -> Int {
        return pets.count
    }
    
    func getPet(indexPath: IndexPath) -> Pet {
        return pets[indexPath.item]
    }

    func getAllPets() -> [Pet] {
        return pets
    }
}
