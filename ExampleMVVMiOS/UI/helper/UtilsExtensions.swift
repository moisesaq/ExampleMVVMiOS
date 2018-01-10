//
//  UtilsExtensions.swift
//  ExampleMVVMiOS
//
//  Created by Moises Apaza on 10/01/2018.
//  Copyright © 2018 Moises Apaza. All rights reserved.
//
import UIKit

extension UIColor {
    static let primary: UIColor = rgb(red: 76, green: 175, blue: 80, alpha: 1)
    static let dark: UIColor = rgb(red: 56, green: 142, blue: 60, alpha: 1)
    static let light: UIColor = rgb(red: 200, green: 230, blue: 201, alpha: 1)
    static let accent: UIColor = rgb(red: 255, green: 65, blue: 129, alpha: 1)
    static let dividir: UIColor = rgb(red: 189, green: 189, blue: 189, alpha: 1)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
