//
//  HomeCollectionViewCell.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    var movieModel: MovieModel?
    private let imageUrlExtension = "https://image.tmdb.org/t/p/original"

    private lazy var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.backgroundColor = .clear
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    func setUp(with movie: MovieModel) {
        movieModel = movie
        addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.heightAnchor.constraint(equalToConstant: 150),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        movieImageView.load(url: imageUrlExtension + movie.posterPath)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
