//
//  DesignableXIBView.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

@IBDesignable class DesignableXIBView: UIView {
    //MARK: - Properties
    var contentView: UIView?
    @IBInspectable var nibName: String?
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
}

//MARK: - Helpers
extension DesignableXIBView {
    private func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    private func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else { return nil }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self).first as? UIView
    }
}
