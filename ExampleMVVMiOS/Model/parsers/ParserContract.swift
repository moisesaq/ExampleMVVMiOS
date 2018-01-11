//
//  BaseParser.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation

protocol ParserContract {
    
    func getItem<T>() -> T
    
    func postItem<T, U>(item: T) -> U
}
