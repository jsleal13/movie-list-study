//
//  MovieDetailView.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
import UIKit

class MovieDetailView: UIView {
    private let imageUrlExtension = "https://image.tmdb.org/t/p/original"

    var movie : MovieDetailModel? {
        didSet {
            guard let movie = movie else { return }
            titleLabel.text = movie.title
            descriptionLabel.text = movie.overview
            statusLabel.text = movie.status
            mainImage.load(url: imageUrlExtension + movie.posterPath)
            runtimeLabel.text = "Duration: \(movie.runtime)min"
        }
    }

    private lazy var scrollView: UIScrollView = {
        let element = UIScrollView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.showsVerticalScrollIndicator = false
        return element
    }()

    private lazy var mainStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [
            titleLabel,
            mainImage,
            descriptionStackView,
            descriptionLabel
        ])
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.spacing = 8
        element.alignment = .fill
        return element
    }()

    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .boldSystemFont(ofSize: 32)
        element.textColor = AppColors.textColor
        return element
    }()

    private lazy var mainImage: UIImageView = {
        let element = UIImageView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.contentMode = .scaleAspectFit
        element.clipsToBounds = true
        element.layer.cornerRadius = 8
        return element
    }()

    private lazy var genresStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        return element
    }()

    private lazy var descriptionStackView: UIStackView = {
        let element = UIStackView(arrangedSubviews: [
            runtimeLabel,
            favoriteButton
        ])
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .horizontal
        element.spacing = 8
        return element
    }()

    private lazy var descriptionLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = .systemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        element.numberOfLines = 0
        element.lineBreakMode = .byWordWrapping
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
        element.font = .systemFont(ofSize: 16)
        element.textColor = AppColors.textColor
        element.numberOfLines = 0
        element.lineBreakMode = .byWordWrapping
        return element
    }()

    private lazy var favoriteButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.backgroundColor = .yellow
        element.clipsToBounds = true
        element.layer.cornerRadius = 10
        return element
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }

    private func setViews() {
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24),
            mainStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            mainImage.heightAnchor.constraint(equalToConstant: 430),

            favoriteButton.heightAnchor.constraint(equalToConstant: 32),
            favoriteButton.widthAnchor.constraint(equalToConstant: 32)
        ])
    }

    func configureMovie(with movie: MovieDetailModel?) {
        self.movie = movie
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
