//
//  BaseCollectionController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

class BaseCollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    lazy var activityIndicatorView: UIActivityIndicatorView = {
        return UIActivityIndicatorView().toLoadingStyle()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        addAndStartActivityIndicator()
    }
    
    private func setUpCollectionView(){
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.scrollDirection = .vertical
        }
        collectionView?.backgroundColor = .white
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
    
    private func addAndStartActivityIndicator(){
        view.addSubview(activityIndicatorView)
        activityIndicatorView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
    func changeStatusLoading(animate: Bool){
        animate ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
    }
    
    /*func stopLoading(){
        activityIndicatorView.stopAnimating()
    }*/
}
