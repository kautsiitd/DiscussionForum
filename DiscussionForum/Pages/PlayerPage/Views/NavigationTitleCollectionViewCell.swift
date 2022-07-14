//
//  NavigationTitleCollectionViewCell.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class NavigationTitleCollectionViewCell: UICollectionViewCell {
    //MARK: - Elements
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var highlighterView: UIView!
    //MARK: - Properties
    var title: String? = nil {
        didSet { titleLabel.text = title }
    }
    
    //MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        title = nil
    }
}

//MARK: - Available Functions
extension NavigationTitleCollectionViewCell {
    func setHighlight(_ isHighlight: Bool) {
        highlighterView.isHidden = !isHighlight
        titleLabel.font = isHighlight ? .systemFont(ofSize: 13, weight: .heavy) :
                                        .systemFont(ofSize: 13, weight: .bold)
    }
}
