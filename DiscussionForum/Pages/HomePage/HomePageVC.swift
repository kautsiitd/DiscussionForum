//
//  HomePageVC.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class HomePageVC: UIViewController {
    //MARK: Elements
    @IBOutlet private var tableView: UITableView!
    //MARK: Properties
    var model: HomePageModel? = nil
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        model = HomePageModel(viewController: self)
        setupView()
    }
}

//MARK: - UITableView
extension HomePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "\(MovieTableViewCell.self)"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieTableViewCell
        cell.movie = model!.movies[indexPath.row]
        return cell
    }
}

extension HomePageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerPageVC = PlayerPageVC()
        navigationController?.pushViewController(playerPageVC, animated: true)
    }
}

//MARK: - ApiRespondable
extension HomePageVC: ApiRespondable {
    func didFetchSuccessfully(for params: [String : AnyHashable]) {
        tableView.reloadData()
    }
    func didFail(with error: BaseError, for params: [String : AnyHashable]) {
        print(error.title, error.description)
    }
}

//MARK: - Helpers
extension HomePageVC {
    private func setupView() {
        let nibName = "\(MovieTableViewCell.self)"
        let nib = UINib(nibName: nibName, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: nibName)
        tableView.rowHeight = UITableView.automaticDimension
    }
}
