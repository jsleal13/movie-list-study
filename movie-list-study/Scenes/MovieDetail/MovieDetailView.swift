//
//  MovieDetailView.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
import UIKit

class MovieDetailView: UIView {
    var movie : MovieDetailModel? {
        didSet {
            guard let movie = movie else { return }
            titleLabel.text = movie.title
            subtitleLabel.text = movie.tagline
            descriptionLabel.text = movie.overview
            statusLabel.text = movie.status
        }
    }

    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var subtitleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 10)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var mainImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var genresStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        return element
    }()

    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 32)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var statusLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var runtimeLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var popularityLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var saveButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }

    private func setViews() {
        addSubview(titleLabel)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    func configureMovie(with movie: MovieDetailModel?) {
        self.movie = movie
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
