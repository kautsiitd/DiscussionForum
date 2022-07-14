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
    @IBOutlet weak var voteCountLabel: UILabel!
    
    //MARK: - Properties
    var id: String = "--"
    var model: DiscussionPageModel? = nil
    var newUpVotes = 0 {
        didSet { DispatchQueue.main.async {
            self.voteCountLabel.text = String(self.newUpVotes)
        }}
    }
    
    //MARK: - LifeCycle
    convenience init(id: String) {
        self.init()
        self.id = id
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        model = DiscussionPageModel(id: id, viewController: self)
        configureActions()
    }
    
    func configureActions() {
        let upAction = UIAction { action in
            self.newUpVotes = Helper.updateCount(upvotes: Int(self.model?.discussion?.post.upvotes ?? 0), action: .upVote)
        }
        upVoteButton.sendAction(upAction)
    }
    
    private func setupUI() {
        setupTableView()
        setupReply()
    }
    private func setupTableView() {
        let nibName = "\(AnswerTableViewCell.self)"
        let nib = UINib.init(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        tableView.rowHeight = UITableView.automaticDimension
    }
    private func setupReply() {
        replySectionView.layer.borderWidth = 1
        replySectionView.layer.borderColor = UIColor(red:27/255, green:48/255, blue:68/255, alpha: 1).cgColor
        
        replyTextField.text = nil
        replyTextField.placeholder = "Add your reply here.."
    }
}

//MARK: - IBActions
extension DiscussionPageVC {
    @IBAction func sendClicked(_ sender: Any) {
        let text = replyTextField.text ?? "Hey, interesting question!"
        replyTextField.text = nil
        let answer = Answer(id: String(Int.random(in: 20...100000)), text: text, upvotes: 0, userName: "Rabbi")
        model?.discussion?.answers.append(answer)
        tableView.reloadData()
        let answersCount = model?.discussion?.answers.count ?? 0
        if answersCount > 0 {
            let lastIndexPath = IndexPath(row: answersCount-1, section: 0)
            tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        }
    }
}

//MARK: - UITableView
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
        questionLabel.text = model?.discussion?.post.text
        tableView.reloadData()
    }
    func didFail(with error: BaseError, for params: [String : AnyHashable]) {
        print(error.title, error.description)
    }
}
