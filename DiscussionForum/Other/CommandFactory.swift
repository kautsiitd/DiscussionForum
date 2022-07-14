//
//  CommandFactory.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class CommandFactory {
    static let shared: CommandFactory = CommandFactory()
    
    private init() {}
}

//MARK: - Available Functions
extension CommandFactory {
    func openCreatePost(for movieID: String, on vc: UIViewController) {
        let createPostPageVC = CreatePostPageVC()
        vc.navigationController?.pushViewController(createPostPageVC, animated: true)
    }
    func openPlayer(for id: String, on vc: UIViewController) {
        let playerPageVC = PlayerPageVC()
        vc.navigationController?.pushViewController(playerPageVC, animated: true)
    }
    func openPost(for id: String, on vc: UIViewController) {
        let discussionPageVC = DiscussionPageVC()
        discussionPageVC.id = id
        vc.navigationController?.pushViewController(discussionPageVC, animated: true)
    }
}
