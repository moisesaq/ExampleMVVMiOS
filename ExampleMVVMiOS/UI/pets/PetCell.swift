//
//  PetCell.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 11/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class PetCell: BaseCell{
    private let PADDING: CGFloat = 10
    private let HEIGHT_TEXT_FIELD: CGFloat = 30
    private let testImage = "https://bcdn.newshunt.com/cmd/resize/400x400_60/fetchdata12/images/e6/50/25/e650252d1127973046446cb82f466e46.jpg"
    
    var pet: Pet? {
        didSet {
            guard let pet = pet else { return }
            loadImage(imageUrl: pet.photoUrl ?? "")
            nameLabel.text = pet.name
            categoryLabel.text = pet.category
        }
    }
    
    lazy var imageView: UIImageView = {
        return UIImageView().toImageViewRound()
    }()
    
    let nameLabel: UILabel = {
        return UILabel().toCustomLabel(fontSize: UIFont.boldSystemFont(ofSize: 15))
    }()
    
    let categoryLabel: UILabel = {
        return UILabel().toCustomLabel(textColor: .gray, fontSize: UIFont.systemFont(ofSize: 12))
    }()
    
    override func setUp() {
        backgroundColor = .white
        addViews()
        setUpConstraints()
    }
    
    private func addViews(){
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(categoryLabel)
    }
    
    private func setUpConstraints(){
        imageView.snp.makeConstraints { (make) in
            make.centerY.height.equalTo(self)
            make.width.equalTo(90)
            make.left.equalTo(self).offset(PADDING)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            setUpContraintsLabel(make: make)
            make.top.equalTo(self).offset(PADDING)
        }
        
        categoryLabel.snp.makeConstraints { (make) in
            setUpContraintsLabel(make: make)
            make.top.equalTo(nameLabel.snp.bottom)
        }
    }
    
    private func setUpContraintsLabel(make: ConstraintMaker){
        make.left.equalTo(imageView.snp.right).offset(10)
        make.right.equalTo(self)
        make.height.equalTo(HEIGHT_TEXT_FIELD)
    }
    
    private func createEdgeInsets(padding: CGFloat) -> UIEdgeInsets{
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    private func loadImage(imageUrl: String){
        if !imageUrl.isEmpty {
            imageView.kf.indicatorType = IndicatorType.activity
            imageView.kf.setImage(with: URL(string: testImage))
        }
    }
}
