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
    func openPlayer(for id: String, on vc: UIViewController) {
        let playerPageVC = PlayerPageVC()
        vc.navigationController?.pushViewController(playerPageVC, animated: true)
    }
    func openPost(for id: String, on vc: UIViewController) {
        let discussionPageVC = DiscussionPageVC()
        vc.navigationController?.pushViewController(discussionPageVC, animated: true)
    }
}
