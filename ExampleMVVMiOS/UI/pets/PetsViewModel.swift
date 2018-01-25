//
//  PetsViewModel.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 11/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import Foundation
import RxSwift

class PetsViewModel: PetsViewModelRepresentable{    
    let serviceManger: ServiceContract
    var delegate: PetsViewModelDelegate?
    let disposeBag = DisposeBag()
    
    private var pets: [Pet] = [] {
        didSet{
            delegate?.reloadCollectionView()
        }
    }
    
    init(service: ServiceContract! = ServiceManager(), delegate: PetsViewModelDelegate) {
        serviceManger = service
        self.delegate = delegate
    }
    
    func loadPets(status: String) {
        delegate?.updateLoadingStatus(status: true)
        serviceManger.findPetsByStatus(status: status)
            .debug()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { self.pets = $0 }, onError: { self.error(error: $0) }, onCompleted: {
                self.delegate?.updateLoadingStatus(status: false)
            }).disposed(by: disposeBag)
    }
    
    private func error(error: Error){
        print(error)
        delegate?.showError(message: "Error")
    }
    
    func numberOfItemsInSection() -> Int {
        return pets.count
    }
    
    func getPet(indexPath: IndexPath) -> Pet {
        return pets[indexPath.item]
    }

    func getAllPets() -> [Pet] {
        return pets
    }
}
