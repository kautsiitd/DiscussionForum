//
//  QTileTableViewCell.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class QTileTableViewCell: UITableViewCell {
    //MARK: - Properties
    var question: Question? = nil {
        didSet { refreshView() }
    }
    //MARK: - Elements
    @IBOutlet private var userImageView: UIImageView!
    @IBOutlet private var userNameLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!

    //MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        question = nil
    }
}

//MARk: - Helpers
extension QTileTableViewCell {
    private func refreshView() {
        userImageView.image = UIImage(withName: question?.userName)
        userNameLabel.text = question?.userName
        titleLabel.text = question?.text
    }
}
