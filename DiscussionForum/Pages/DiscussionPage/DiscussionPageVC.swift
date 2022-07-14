//
//  DiscussionPageVC.swift
//  TestApp
//
//  Created by Kankanwadi, Raju on 14/07/22.
//

import UIKit

class DiscussionPageVC: UIViewController {
    //MARK: - Constants
    let answertext1 = "So I’ve recently started getting deeper into lotr lore after watching the movies. I wanted to ask, they say that mithril is one of the strongest metals and whatnot, I always wondered if Fingolfin had worn mithril during his battle with Morgoth, would he have survived or maybe last longer to injure him further. I know that morgoth is a valar and holds immense power but would mithril have helped or would it have made no difference."
    let answertext = "The Valar don't want to get involved in Middle-Earth."
    
    //MARK: - Elements
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var QuestionLabel: UILabel!
    @IBOutlet private var replySectionView: UIView!
    @IBOutlet private var replyTextField: UITextField!
    @IBOutlet private var sendButton: UIButton!

    //MARK: - Properties
    var answers:[Answer] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - IBActions
extension DiscussionPageVC {
    @IBAction func sendClicked(_ sender: Any) {
//        let text = replyTextField.text ?? "Hey, interesting question!"
        replyTextField.text = nil
//        answers.append(Answer(answertext: text))
        tableView.reloadData()
    }
}

//MARK: - UITableView
extension DiscussionPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(AnswerTableViewCell.self)", for: indexPath) as! AnswerTableViewCell
        cell.replyTextLabel.text = answers[indexPath.row].text
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DiscussionPageVC: UITableViewDelegate {
    
}

//MARK: - Helpers
extension DiscussionPageVC {
    private func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        let nibName = "\(AnswerTableViewCell.self)"
        let nib = UINib.init(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        answers = []
        self.replySectionView.layer.borderWidth = 1
        self.replySectionView.layer.borderColor = UIColor(red:27/255, green:48/255, blue:68/255, alpha: 1).cgColor
        replyTextField.text = nil
        replyTextField.placeholder = "Add your reply here.."
        tableView.reloadData()
    }
}
