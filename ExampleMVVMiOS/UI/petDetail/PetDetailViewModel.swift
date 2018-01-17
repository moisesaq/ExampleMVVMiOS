//
//  PetDetailModel.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 16/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class PetDetailViewModel: PetDetailModelRepresentable {
    let serviceManger: ServiceContract
    
    var pet: Pet? {
        didSet{
            self.reloadPet?()
        }
    }
    
    private var isLoading: Bool = false{
        didSet{
            self.updateLoadingStatus?(isLoading)
        }
    }
    
    var reloadPet: (()->())?
    var updateLoadingStatus: ((Bool)->())?
    var showError: ((String)->())?
    
    init(service: ServiceContract = ServiceManager()) {
        serviceManger = service
    }
    
    func loadPet(id: Int) {
        self.isLoading = true
        serviceManger.findPetById(id: String(id), completion: { (pet) -> (Void) in
            self.isLoading = false
            self.pet = pet
        }) { () -> (Void) in
            self.showError?("Error find pet")
        }
    }
}
