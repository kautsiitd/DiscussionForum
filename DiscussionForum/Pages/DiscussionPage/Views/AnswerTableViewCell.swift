//
//  AnswerTableViewCell.swift
//  TestApp
//
//  Created by Kankanwadi, Raju on 14/07/22.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
    //MARK: - Elements
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var replyTextLabel: UILabel!
    @IBOutlet weak var upvotesCountLabel: UILabel!
    
    //MARK: - Properties
    var answer: Answer? {
        didSet { refreshView() }
    }
}

//MARK: - IBActions
extension AnswerTableViewCell {
    @IBAction func reportSpoilerClicked(_ sender: Any) {
        replyTextLabel.text = answer?.text ?? ""
        userNameLabel.text = answer?.userName ?? "xrayUser"
        upvotesCountLabel.text = "\(answer?.upvotes ?? 0) upvotes"
    }
}

//MARK: - Helpers
extension AnswerTableViewCell {
    private func refreshView() {
        userImageView.image = UIImage(withName: answer?.userName)
        userNameLabel.text = answer?.userName
        replyTextLabel.text = answer?.text
        upvotesCountLabel.text = "\(answer?.upvotes ?? 0)"
    }
}
