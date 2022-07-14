//
//  Answer.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation
struct Answer: Codable {
    let id: String
    let text: String
    let upvotes: Int
    let userName: String
}
