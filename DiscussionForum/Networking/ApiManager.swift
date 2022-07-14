//
//  ApiManager.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation

class ApiManager {
    static let shared: ApiManager = ApiManager()
    
    private init() {}
}

//MARK: - CoreLoading
extension ApiManager {
    func loadLocalData(with modal: CoreLoadable) throws {
        guard let path = Bundle.main.path(forResource: modal.fileName,
                                          ofType: modal.fileExtension)
        else { throw FileError.notFound }
        let fileURL = URL(fileURLWithPath: path)
        let params = ["name": modal.fileName, "extension": modal.fileExtension]
        
        DispatchQueue.main.async {
            do { let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
                try modal.parse(data)
                modal.didFetchSuccessfully(for: params)
            } catch let error {
                modal.didFail(with: FileError.custom(error), for: params)
            }
        }
    }
}
