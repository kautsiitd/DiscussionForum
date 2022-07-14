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
    @IBOutlet weak var upvoteButton: UIButton!
    @IBOutlet weak var downVoteButton: UIButton!
    @IBOutlet weak var reportSpoilerButton: UIButton!
    
    func configureCell() {
        replyTextLabel.text = "So I’ve recently started getting deeper into lotr lore after watching the movies. I wanted to ask, they say that mithril is one of the strongest metals and whatnot, I always wondered if Fingolfin had worn mithril during his battle with Morgoth, would he have survived or maybe last longer to injure him further. I know that morgoth is a valar and holds immense power but would mithril have helped or would it have made no difference."
    }
    @IBAction func reportSpoilerClicked(_ sender: Any) {
        
    }
}
