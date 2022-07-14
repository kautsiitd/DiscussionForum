//
//  Discussion.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation

// MARK: - Discussion
struct Discussion: Codable {
    let post: Post
    var answers: [Answer]
}

// MARK: - Post
struct Post: Codable {
    let id, text, userName, upvotes: String
    let comments, category: String
}
