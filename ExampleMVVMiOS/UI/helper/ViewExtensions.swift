//
//  ViewExtensions.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//

import UIKit

extension UIButton {
    
    func toCustomButton(title: String, color: UIColor) -> UIButton{
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
        self.setTitle(title, for: .normal)
        self.tintColor = .white
        return self
    }
    
    func addImage(imageName: String) -> UIButton{
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        self.setImage(image, for: .normal)
        return self
    }
    
    func addAction(target: Any?, action: Selector) -> UIButton{
        self.addTarget(target, action: action, for: .touchUpInside)
        return self
    }
}

extension UIImageView {
    
    func toImageViewRound(imageName: String? = nil) -> UIImageView{
        self.backgroundColor = UIColor.primary
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.primary.cgColor
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
        if let imageName = imageName {
            self.image = UIImage(named: imageName)
        }
        return self
    }
    
    func toIconStyle(image: String?, tint: UIColor) -> UIImageView{
        self.contentMode = .scaleToFill
        self.tintColor = tint
        if let imageName = image {
            self.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        }
        return self
    }
    
    func enableGestureDetect(enable: Bool) -> UIImageView{
        self.isUserInteractionEnabled = enable
        return self
    }
}

extension UILabel {
    
    func toCustomLabel(textColor: UIColor! = .black, numberOfLines: Int! = 1, fontSize: UIFont! = UIFont.boldSystemFont(ofSize: 15)) -> UILabel{
        self.text = "_ _ _ _ _"
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.font = fontSize
        return self
    }
    
    func alignmentCenter() -> UILabel {
        self.textAlignment = .center
        return self
    }
}

extension UIActivityIndicatorView {
    
    func toLoadingStyle(start: Bool! = false) -> UIActivityIndicatorView {
        self.activityIndicatorViewStyle = .gray
        self.translatesAutoresizingMaskIntoConstraints = false
        if start {
            self.startAnimating()
        }
        return self
    }
}
