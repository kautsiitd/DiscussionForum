//
//  UIView.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

//MARK: - IBDesignable
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

//MARK: - Functional
extension UIView {
    class func fromNib(named: String? = nil) throws -> Self {
        let name = named ?? "\(Self.self)"
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil),
              let view = nib.first as? Self
        else { throw FileError.notFound }
        
        return view
    }
}
