//
//  HomeCollectionViewCell.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation
import UIKit

protocol HomeCollectionViewCellDelegate {
    func toggleFavorite(_ cell: HomeCollectionViewCell, id: String)
}

class HomeCollectionViewCell: UICollectionViewCell {
    var delegate: HomeCollectionViewCellDelegate?
    var movieModel: MovieModel?

    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        return image
    }()

    private lazy var movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpTitleLabel()
    }
    
    func setUp(with movie: MovieModel) {
        movieModel = movie
    }


    private func setUpTitleLabel(){
        addSubview(movieTitleLabel)
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            movieTitleLabel.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
