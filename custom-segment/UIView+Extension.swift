//  UIView+Extension.swift
//  custom-segment
//
//  Created by Nijat Hamid on 11/13/24.


import UIKit

extension UIView {
    @IBInspectable
    var radius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
            
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}
