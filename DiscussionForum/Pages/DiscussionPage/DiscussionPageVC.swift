//
//  DiscussionPageVC.swift
//  TestApp
//
//  Created by Kankanwadi, Raju on 14/07/22.
//

import UIKit

class DiscussionPageVC: UIViewController {
    //MARK: - Elements
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var replySectionView: UIView!
    @IBOutlet weak var replyTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var upVoteButton: UIButton!
    @IBOutlet weak var downVoteButton: UIButton!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    //MARK: - Properties
    var model: DiscussionPageModel? = nil
    var newUpVotes = 0 {
        didSet { DispatchQueue.main.async {
            self.voteCountLabel.text = String(self.newUpVotes)
        }}
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        model = DiscussionPageModel(viewController: self)
        configureActions()
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        let text = replyTextField.text ?? "Hey, interesting question!"
        replyTextField.text = nil
        let comment = Answer(id: String(Int.random(in: 20...100)), text: text, upvotes: 0, userName: "xrayUser")
        model?.discussion?.answers.append(comment)
        tableView.reloadData()
    }
    
    func configureActions() {
        let upAction = UIAction { action in
            self.newUpVotes = Helper.updateCount(upvotes: Int(self.model?.discussion?.post.upvotes ?? 0), action: .upVote)
        }
        upVoteButton.sendAction(upAction)
        
        let downVoteAction = UIAction { action in
            self.newUpVotes = Helper.updateCount(upvotes: Int(self.model?.discussion?.post.upvotes ?? 0), action: .downVote)
        }
        downVoteButton.sendAction(downVoteAction)
    }
    
    fileprivate func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        let nibName = "\(AnswerTableViewCell.self)"
        let nib = UINib.init(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        self.replySectionView.layer.borderWidth = 1
        self.replySectionView.layer.borderColor = UIColor(red:27/255, green:48/255, blue:68/255, alpha: 1).cgColor
        replyTextField.text = nil
        replyTextField.placeholder = "Add your reply here.."
    }
}

extension DiscussionPageVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.discussion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(AnswerTableViewCell.self)", for: indexPath) as? AnswerTableViewCell {
            if let answer = model?.discussion?.answers[indexPath.row] {
                cell.answer = answer
            }
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

//MARK: - ApiRespondable
extension DiscussionPageVC: ApiRespondable {
    func didFetchSuccessfully(for params: [String : AnyHashable]) {
        tableView.reloadData()
    }
    func didFail(with error: BaseError, for params: [String : AnyHashable]) {
        print(error.title, error.description)
    }
}
