//
//  API.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class API {
    static let BASE_URL = "http://petstore.swagger.io/v2/"
    static let PET = BASE_URL + "pet/"
    static let PETS_BY_STATUS = PET + "findByStatus"
}
