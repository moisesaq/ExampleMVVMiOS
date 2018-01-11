//
//  Pet.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//



import Foundation

class Pet{
    var id: String?
    var name: String?
    var category: String?
    var photoUrl: String?
    
    init(id: String, name: String, category: String, photoUrl: String) {
        self.id = id
        self.name = name
        self.category = category
        self.photoUrl = photoUrl
    }
}
