//
//  PlayerPageVC.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class PlayerPageVC: UIViewController {
    //MARK: - Elements
    @IBOutlet private var xrayMainView: XrayMainView!
    //MARK: - Properties
    var model: PlayerPageModel? = nil
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        xrayMainView.parentVC = self
        model = PlayerPageModel(viewController: self)
    }
}

//MARK: - IBActions
extension PlayerPageVC {
    @IBAction private func createPost() {
        CommandFactory.shared.openCreatePost(for: "1", on: self)
    }
}

//MARK: - ApiRespondable
extension PlayerPageVC: ApiRespondable {
    func didFetchSuccessfully(for params: [String : AnyHashable]) {
        xrayMainView.questions = model?.questions ?? []
    }
    func didFail(with error: BaseError, for params: [String : AnyHashable]) {
        print(error.title, error.description)
    }
}
