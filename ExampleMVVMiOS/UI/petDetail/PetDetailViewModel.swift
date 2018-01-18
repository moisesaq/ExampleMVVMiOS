//
//  PetDetailModel.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 16/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import RxSwift

class PetDetailViewModel: PetDetailModelRepresentable {
    let serviceManger: ServiceContract
    let disposeBag = DisposeBag()
    
    var pet: Pet? {
        didSet{
            self.reloadPet?()
        }
    }
    
    private var isLoading: Bool = false{
        didSet{
            self.updateLoadingStatus?(isLoading)
        }
    }
    
    var reloadPet: (()->())?
    var updateLoadingStatus: ((Bool)->())?
    var showError: ((String)->())?
    
    init(service: ServiceContract = ServiceManager()) {
        serviceManger = service
    }
    
    func loadPet(id: Int) {
        self.isLoading = true
        serviceManger.findPetsById(id: String(id))
            .debug()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { self.pet = $0 }, onError: { self.error(error: $0) },onCompleted: { self.isLoading = false })
            .disposed(by: disposeBag)
        /*serviceManger.findPetById(id: String(id), completion: { (pet) -> (Void) in
            self.isLoading = false
            self.pet = pet
        }) { () -> (Void) in
            self.showError?("Error find pet")
        }*/
    }
    
    private func error(error: Error){
        showError?("Error")
    }
}
