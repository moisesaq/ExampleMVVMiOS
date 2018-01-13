//
//  PetsControllerDelegate.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 13/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

protocol PetsViewModelDelegate {
    
    func reloadCollectionView()
    
    func updateLoadingStatus(status: Bool)
    
    func showError(message: String)
}
