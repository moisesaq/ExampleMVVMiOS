//
//  PetParser.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class PetParser: Decodable {
    var id: Int = 0
    var category: Category?
    var name: String?
    var photoUrls: [String] = []
    //var tags: [Tag] = []
    var status: String = ""
    
    func toPet() -> Pet{
        return Pet(id: id, name: name ?? "none", category: getCategory(), photoUrl: getPhoto(), status: status)
    }
    
    func getCategory() -> String{
        guard let category = category else{
            return "none"
        }
        return category.name
    }
    
    func getPhoto() -> String {
        return photoUrls.count > 0 ? photoUrls[0] : "none"
    }
}

class Category: Decodable {
    var id: Int = 0
    var name: String = ""
}

class Tag: Decodable {
    var id: Int?
    var name: String?
}
