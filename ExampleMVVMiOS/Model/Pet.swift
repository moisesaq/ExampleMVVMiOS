//
//  Pet.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//



import Foundation

class Pet{
    var id: Int?
    var name: String?
    var category: String?
    var photoUrl: String?
    var status: String?
    
    init(id: Int, name: String, category: String, photoUrl: String, status: String) {
        self.id = id
        self.name = name
        self.category = category
        self.photoUrl = photoUrl
        self.status = status
    }
}
