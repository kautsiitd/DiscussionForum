//
//  BaseModel.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation

class BaseCoreLodableModel: CoreLoadable {
    //MARK: - Properties
    let viewController: ApiRespondableVC
    
    init(viewController: ApiRespondableVC) {
        self.viewController = viewController
        do { try ApiManager.shared.loadLocalData(with: self) }
        catch let error { viewController.didFail(with: FileError.custom(error), for: [:]) }
    }
    
    //MARK: - CoreLoadable
    var fileName: String { "" }
    var fileExtension: String { "" }
    
    func parse(_ data: Data) throws {}
    
    //MARK: - ApiRespondable
    func didFetchSuccessfully(for params: [String : AnyHashable]) {
        viewController.didFetchSuccessfully(for: params)
    }
    func didFail(with error: BaseError, for params: [String : AnyHashable]) {
        viewController.didFail(with: error, for: params)
    }
}
