//
//  PetParser.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

class PetParser: NSObject, Decodable, Encodable, BaseParser {
    typealias T = Pet
    typealias U = PetParser
    
    var id: Int = 0
    var category: Category?
    var name: String?
    var photoUrls: [String] = []
    var tags: [Tag] = []
    var status: String = ""
    
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        do {
            category = try values.decode(Category.self, forKey: .category)
        }catch {
            category = Category()
        }
        do {
            name = try values.decode(String.self, forKey: .name)
        } catch {
            name = "No name"
        }
        
        photoUrls = try values.decode([String].self, forKey: .photoUrls)
        do {
            tags = try values.decode([Tag].self, forKey: .tags)
        }catch {
            tags = []
        }
        status = try values.decode(String.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(photoUrls, forKey: .photoUrls)
        try container.encode(status, forKey: .status)
    }
    
    enum CodingKeys: String, CodingKey{
        case id
        case category
        case name
        case photoUrls
        case tags
        case status
    }
    
    func getItem() -> Pet {
        return Pet(id: id, name: getName(), category: getCategory(), photoUrl: getPhoto(), status: status)
    }
    
    func postItem(item: Pet) -> PetParser? {
        let parser = PetParser()
        parser.id = 123
        parser.name = item.name
        parser.photoUrls = []
        parser.status = "test"
        return parser
    }
}

class Category: Decodable {
    var id: Int = 0
    var name: String = "Default category"
}

class Tag: Decodable {
    var id: Int?
    var name: String?
}

extension PetParser {
    func getName() -> String{
        return name!.isEmpty ? "Without name" : name!
    }
    
    func getCategory() -> String{
        if let cat = category {
            return cat.name
        }
        return "No category"
    }
    
    func getPhoto() -> String {
        return photoUrls.count > 0 ? photoUrls[0] : "none"
    }
}
