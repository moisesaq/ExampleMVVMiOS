//
//  SearchController.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 17/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class SearchController: BaseController {
    
    let keyboardDismissView: KeyboardDismissingView = {
        return KeyboardDismissingView()
    }()
    
    lazy var textField: UITextField = {
        return LeftPaddedTextField().toCustomTextField(holder: "Pet ID").addDelegate(delegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        addViews()
    }
    
    private func setUp(){
        changeTitle(title: "Search pet")
    }
    
    private func addViews(){
        view.addSubview(keyboardDismissView)
        keyboardDismissView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        keyboardDismissView.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.center.equalTo(keyboardDismissView)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
}

extension SearchController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
