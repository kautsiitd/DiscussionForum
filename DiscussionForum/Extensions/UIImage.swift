//
//  UIImage.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

extension UIImage {
    convenience init?(withName name: String?) {
        guard let name = name else { return nil }
        self.init(named: name)
    }
}
