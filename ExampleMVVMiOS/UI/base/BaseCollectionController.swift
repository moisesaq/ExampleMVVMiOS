//
//  BaseCollectionController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BaseCollectionController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .vertical
        }
        collectionView?.backgroundColor = .yellow
        collectionView?.alwaysBounceVertical = true
    }
    
    func changeTitle(title: String){
        self.navigationItem.title = title
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func registerCell(cellClass: Swift.AnyClass?, identifier: String){
        self.collectionView!.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
}
