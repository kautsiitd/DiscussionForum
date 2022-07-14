//
//  Question.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation
struct Question: Codable {
    let id: String
    let text: String
    let userName: String
    let upvotes: Int
    let comments: Int
    let category: QuestionCategory
}

//MARK: - Enums
extension Question {
    enum QuestionCategory: String, Codable {
        case lore, Question, AlternativePlot, General, Opinion
        
        var text: String {
            switch self {
            case .lore: return "Lore"
            case .Question: return "Q&A"
            case .AlternativePlot: return "AP"
            case .General: return "General"
            case .Opinion: return "Opinion"
            }
        }
    }
}
