//
//  Helper.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation
import UIKit

enum VoteAction: String {
    case upVote, downVote
}
class Helper {
    static func updateCount(upvotes: Int, action: VoteAction) -> Int {
        if action == .upVote {
            return upvotes+1
        } else {
            return upvotes-1
        }
    }
}
