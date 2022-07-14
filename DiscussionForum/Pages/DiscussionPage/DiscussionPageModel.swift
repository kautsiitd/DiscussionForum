//
//  DiscussionPageModel.swift
//  DiscussionForum
//
//  Created by Kankanwadi, Raju on 14/07/22.
//

import Foundation

class DiscussionPageModel: BaseCoreLodableModel {
    //MARK: - Properties
    var discussion: Discussion?
    
    //MARK: - CoreLoadable
    override var fileName: String { "Post_\(id)" }
    override var fileExtension: String { "json" }
    
    override func parse(_ data: Data) throws {
        let decoder = JSONDecoder()
        discussion = try decoder.decode(Discussion.self, from: data)
    }
}
