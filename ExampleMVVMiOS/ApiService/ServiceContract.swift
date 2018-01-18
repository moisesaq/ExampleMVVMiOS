//
//  ServiceContract.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation
import RxSwift

protocol ServiceContract {
    
    func getPetsByStatus(status: String, completion: @escaping ([Pet]) -> Void, error: @escaping (String) -> Void)
    
    func findPetById(id: String, completion: @escaping (Pet) -> (Void), error: @escaping () -> (Void))
    
    func findPetsByStatus(status: String) -> Observable<[Pet]>
    
    func findPetsById(id: String) -> Observable<Pet>
}
