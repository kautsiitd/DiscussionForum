//
//  MovieTableViewCell.swift
//  DiscussionForum
//
//  Created by Kautsya Kanu on 14/07/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    //MARK: - Properties
    var movie: Movie? = nil {
        didSet { refreshView() }
    }
    //MARK: - Elements
    @IBOutlet private var movieImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!

    //MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        movie = nil
    }
}

//MARk: - Helpers
extension MovieTableViewCell {
    private func refreshView() {
        movieImageView.image = UIImage(withName: movie?.imageName)
        titleLabel.text = movie?.title
    }
}
