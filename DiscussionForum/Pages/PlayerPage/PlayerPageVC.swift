//
//  PlayerPageVC.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class PlayerPageVC: UIViewController {
    //MARK: - Elements
    @IBOutlet private var xrayMainView: UIView!
    //MARK: - Properties
    var model: PlayerPageModel? = nil
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        model = PlayerPageModel(viewController: self)
    }
}
