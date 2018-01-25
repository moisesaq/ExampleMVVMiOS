//
//  ApiService.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

class ServiceManager: ServiceContract {
        
    func findPetsByStatus(status: String) -> Observable<[Pet]>{
        let parameters = ["status" : status]
        return getObservable(url: API.PETS_BY_STATUS, parameters: parameters).map({ (data) -> [Pet] in
            let petsParser = try JSONDecoder().decode([PetParser].self, from: data)
            return petsParser.map({ return $0.getItem() })
        })
        /*return RxAlamofire.requestData(.get, API.PETS_BY_STATUS, parameters: parameters).map { (urlResponse, data) -> [Pet] in
            let petsParser = try JSONDecoder().decode([PetParser].self, from: data)
            return petsParser.map({ return $0.getItem() })
        }.asObservable()*/
    }
    
    func findPetsById(id: String) -> Observable<Pet> {
        let url = API.PET + id
        return getObservable(url: url).map { (data) -> Pet in
            let petParser = try JSONDecoder().decode(PetParser.self, from: data)
            return petParser.getItem()
        }
        /*return RxAlamofire.requestData(.get, url).map({ (urlResponse, data) -> Pet in
            let petParser = try JSONDecoder().decode(PetParser.self, from: data)
            return petParser.getItem()
        }).asObservable()*/
    }
    
    func getObservable(url: String, parameters: Parameters? = nil) -> Observable<Data>{
        return RxAlamofire.requestData(.get, url, parameters: parameters).map { $1 }.asObservable()
    }
}


