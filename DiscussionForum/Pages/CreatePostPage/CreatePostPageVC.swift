//
//  CreatePostViewController.swift
//  TestApp
//
//  Created by Kankanwadi, Raju on 14/07/22.
//

import UIKit

var i = 10
class CreatePostVC: UIViewController {
    //MARK: - Elements
    @IBOutlet private var textViewLabel: UITextView!
    var playerVC: PlayerPageVC?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - IBActions
extension CreatePostVC {
    @IBAction func submitClicked(_ sender: Any) {
//        let question = Question(id: String(Int.random(in: i...100)), text: textViewLabel.text ?? "", userName: "xrayUser", upvotes: 0, comments: 0)
//        i += 1
//        playerVC?.model?.questions.append(question)
    }
}
