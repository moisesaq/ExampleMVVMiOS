//
//  PetDetailController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 16/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit
import SnapKit

class PetDetailController: BaseController {
    
    var pet: Pet?
    
    let petLabel: UILabel = {
        return UILabel().toCustomLabel(numberOfLines: 2).alignmentCenter()
    }()
    
    let categoryLabel: UILabel = {
        return UILabel().toCustomLabel(numberOfLines: 2, fontSize: UIFont.systemFont(ofSize: 12)).alignmentCenter()
    }()
    
    let statusLabel: UILabel = {
        return UILabel().toCustomLabel(numberOfLines: 2, fontSize: UIFont.systemFont(ofSize: 12)).alignmentCenter()
    }()
    
    lazy var petDetailModel: PetDetailViewModel = {
        return PetDetailViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        guard let title = pet?.name else {
            return
        }
        changeTitle(title: title)
        addViews()
        setUpViewModel()
    }
    
    func setUpViewModel(){
        petDetailModel.updateLoadingStatus = { [weak self] (status) in
            self?.updateLoading(status: status)
         }
         
         petDetailModel.reloadPet = { [weak self] () in
            self?.reloadPet()
         }
        
        petDetailModel.loadPet(id: pet!.id!)
    }
    
    private func updateLoading(status: Bool){
        petLabel.text = status ? "Loading....." : pet?.name
    }
    
    private func reloadPet(){
        petLabel.text = petDetailModel.pet?.name ?? "Pet"
        categoryLabel.text = "Category \r\n\(petDetailModel.pet?.category ?? "Category")"
        statusLabel.text = "Status \r\n\(petDetailModel.pet?.status ?? "Status")"
    }
}

// Add subviews
extension PetDetailController {

    private func addViews(){
        view.addSubview(petLabel)
        view.addSubview(categoryLabel)
        view.addSubview(statusLabel)
        
        petLabel.snp.makeConstraints { (make) in
            setUpContraintsLabel(make: make).centerY.equalTo(view)
        }
        
        categoryLabel.snp.makeConstraints { (make) in
            setUpContraintsLabel(make: make).top.equalTo(petLabel.snp.bottom).offset(8)
        }
        
        statusLabel.snp.makeConstraints { (make) in
            setUpContraintsLabel(make: make).top.equalTo(categoryLabel.snp.bottom).offset(8)
        }
    }
    
    private func setUpContraintsLabel(make: ConstraintMaker) -> ConstraintMaker{
        make.left.right.equalTo(view)
        make.height.equalTo(40)
        return make
    }
}
