//
//  Errors.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

enum FileError: BaseError {
case notFound, custom(_ error: Error)
    
    var title: String { return "Something went Wrong!" }
    var description: String {
        switch self {
        case .notFound: return "File Not Found"
        case .custom(let error): return error.localizedDescription
        }
    }
}
