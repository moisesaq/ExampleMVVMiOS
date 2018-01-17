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
    
    static let sharedInstance = ServiceManager()
    
    func getPetsByStatus(status: String, completion: @escaping ([Pet]) -> (), error: @escaping (String) -> ()) {
        let parameters = ["status" : status]
        getRequestHttp(url: API.PETS_BY_STATUS, parameters: parameters, responseHandler: { (data) in
            do{
                let petsParser = try JSONDecoder().decode([PetParser].self, from: data)
                completion(petsParser.map({ return $0.toPet() }))
            }catch let errorJson{
                self.log(message: errorJson)
                error("Error")
            }
        }) {
            error("Error")
        }
    }
    
    func findPetById(id: String, completion: @escaping (Pet) -> (Void), error: @escaping () -> (Void)){
        let url = API.PET + id
        print("URL: " + url)
        getRequestHttp(url: url, parameters: nil, responseHandler: { (data) in
            do{
                let petParser = try JSONDecoder().decode(PetParser.self, from: data)
                completion(petParser.toPet())
            }catch let errorJson{
                self.log(message: errorJson)
                error()
            }
        }) {
            error()
        }
    }
    
    func getRequestHttp(url: URLConvertible, parameters: Parameters?, responseHandler: @escaping (Data) -> Void, errorHandler: @escaping () -> Void){
        Alamofire.request(url, parameters: parameters).responseJSON { (response) in
            print("RESPONSE: \(response)")
            if response.result.isFailure {
                self.log(message: "ERROR GET HTTP REQUEST")
                errorHandler()
                return
            }
            responseHandler(response.data!)
        }
    }
    
    private func log(message: Any){
        print("ERROR", message)
    }
    
    // RxAlamofire
    func findPetsByStatus(status: String) -> Observable<[Pet]>{
        let parameters = ["status" : status]
        return RxAlamofire.requestData(.get, API.PETS_BY_STATUS, parameters: parameters).map { (urlResponse, data) -> [Pet] in
            let petsParser = try JSONDecoder().decode([PetParser].self, from: data)
            return petsParser.map({ return $0.toPet() })
        }.asObservable()
    }
}
