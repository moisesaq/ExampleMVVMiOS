//
//  BaseCell.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 11/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp(){
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
