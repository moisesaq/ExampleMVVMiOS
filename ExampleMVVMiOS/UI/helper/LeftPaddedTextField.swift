//
//  LeftPaddedTextField.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/26/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class LeftPaddedTextField: UITextField{
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}

extension LeftPaddedTextField {
    func toCustomTextField(holder: String, returnType: UIReturnKeyType! = UIReturnKeyType.default) -> LeftPaddedTextField{
        self.placeholder = holder
        //self.borderStyle = UITextBorderStyle.roundedRect
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.keyboardType = .default
        self.returnKeyType = returnType
        return self
    }
    
    func addDelegate(delegate: UITextFieldDelegate) -> LeftPaddedTextField {
        self.delegate = delegate
        return self
    }
}
