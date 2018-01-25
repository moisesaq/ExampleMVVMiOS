//
//  BaseParser.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

protocol BaseParser {
    associatedtype T
    associatedtype U
    
    func getItem() -> T
    
    func postItem(item: T) -> U?
}
