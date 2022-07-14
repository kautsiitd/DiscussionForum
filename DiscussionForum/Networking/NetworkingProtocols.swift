//
//  NetworkingProtocols.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import Foundation

protocol ApiRespondable {
    func didFetchSuccessfully(for params: [String: AnyHashable])
    func didFail(with error: BaseError, for params: [String: AnyHashable])
}

protocol CoreLoadable: ApiRespondable {
    var fileName: String { get }
    var fileExtension: String { get }
    func parse(_ data: Data) throws
}

protocol BaseError: Error {
    var title: String { get }
    var description: String { get }
}
