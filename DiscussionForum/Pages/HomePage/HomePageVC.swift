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
    var movies: [Movie] = []
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = HomePageModel(viewController: self)
        movies = model.moviesList
        setupView()
    }
}

//MARK: - UITableView
extension HomePageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "\(MovieTableViewCell.self)"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MovieTableViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
}

extension HomePageVC: UITableViewDelegate {
    
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
