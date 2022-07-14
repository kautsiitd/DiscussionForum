//
//  PlayerPageModel.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation

class PlayerPageModel: BaseCoreLodableModel {
    //MARK: - Properties
    var questions: [Question] = []
    
    //MARK: - CoreLoadable
    override var fileName: String { "QuestionsList" }
    override var fileExtension: String { "json" }
    
    override func parse(_ data: Data) throws {
        let decoder = JSONDecoder()
        questions = try decoder.decode([Question].self, from: data)
    }
}
