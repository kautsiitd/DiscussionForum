//
//  XrayMainView.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

@IBDesignable class XrayMainView: DesignableXIBView {
    //MARK: - Elements
    @IBOutlet private var navigationView: UICollectionView!
    @IBOutlet private var tableView: UITableView!
    //MARK: - Properties
    var parentVC: UIViewController!
    var currentNavigationIndexPath = IndexPath(item: 0, section: 0)
    let navigationTitles: [String] = ["Forum", "In Scene", "Shop", "BonusContent", "Trivia", "Cast", "Scenes", "Music"]
    var questions: [Question] = [] {
        didSet { tableView.reloadData() }
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNavigationView()
        setupTableView()
    }
}

//MARK: - UICollectionView
extension XrayMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return navigationTitles.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = "\(NavigationTitleCollectionViewCell.self)"
        let cell = navigationView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! NavigationTitleCollectionViewCell
        cell.title = navigationTitles[indexPath.row]
        cell.setHighlight(indexPath == currentNavigationIndexPath)
        return cell
    }
}

extension XrayMainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var cell = collectionView.cellForItem(at: currentNavigationIndexPath) as! NavigationTitleCollectionViewCell
        cell.setHighlight(false)
        cell = collectionView.cellForItem(at: indexPath) as! NavigationTitleCollectionViewCell
        cell.setHighlight(true)
        currentNavigationIndexPath = indexPath
    }
}

//MARK: - UITableView
extension XrayMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = questions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(QTileTableViewCell.self)") as! QTileTableViewCell
        cell.question = question
        return cell
    }
}

extension XrayMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionId = questions[indexPath.row].id
        CommandFactory.shared.openPost(for: questionId, on: parentVC)
    }
}

//MARK: - Helpers
extension XrayMainView {
    private func setupNavigationView() {
        let nibNames = ["\(NavigationTitleCollectionViewCell.self)"]
        for nibName in nibNames {
            let nib = UINib(nibName: nibName, bundle: Bundle.main)
            navigationView.register(nib, forCellWithReuseIdentifier: nibName)
        }
    }
    private func setupTableView() {
        let nibName = "\(QTileTableViewCell.self)"
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        tableView.rowHeight = UITableView.automaticDimension
    }
}
