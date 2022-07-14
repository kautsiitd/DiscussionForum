//
//  HomePageModel.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation
import UIKit

class HomePageModel: BaseCoreLodableModel {
    //MARK: - Properties
    var moviesList: [Movie] = []
    
    //MARK: - CoreLoadable
    override var fileName: String { "Movies" }
    override var fileExtension: String { "txt" }
    
    override func parse(_ data: Data) throws {
        let decoder = JSONDecoder()
        moviesList = try decoder.decode([Movie].self, from: data)
    }
}
