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
    @IBOutlet private var upvoteButton: UIButton!
    @IBOutlet private var followButton: UIButton!
    @IBOutlet private var flagButton: UIButton!
    @IBOutlet private var tagLabel: UILabel!

    //MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        question = nil
    }
}

//MARK: - IBActions
extension QTileTableViewCell {
    @IBAction private func upvoteToggle() {
        
    }
    @IBAction private func followToggle() {
        
    }
}

//MARk: - Helpers
extension QTileTableViewCell {
    private func refreshView() {
        userImageView.image = UIImage(withName: question?.userName)
        userNameLabel.text = question?.userName
        titleLabel.text = question?.text
        tagLabel.text = question?.category.text
        if let question = question {
            upvoteButton.setTitle("\(question.upvotes)", for: .normal)
            followButton.setTitle("\(question.upvotes)", for: .normal)
        } else {
            upvoteButton.setTitle("--", for: .normal)
            followButton.setTitle("--", for: .normal)
        }
    }
}
