//
//  PetsViewModelPresentable.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 13/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

protocol PetsViewModelRepresentable {
    
    func loadPets(status: String)
    
    func numberOfItemsInSection() -> Int
    
    func getPet(indexPath: IndexPath) -> Pet
    
    func getAllPets() -> [Pet]
}
