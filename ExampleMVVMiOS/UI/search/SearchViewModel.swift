//
//  SearchViewModel.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 17/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class SearchViewModel {
    let serviceManager: ServiceContract
    
    init(service: ServiceContract! = ServiceManager()) {
        serviceManager = service
    }
}
