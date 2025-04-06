//
//  HomeView.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import UIKit
import Foundation

struct CellIdentifier {
    static let homeCell = "homeCollectionViewCell"
}

class HomeView: UIView {
    lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = AppColors.backgroundColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.homeCell)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        collectionView.collectionViewLayout = layout
        return collectionView
    }()

    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Welcome, back!"
        element.font = .boldSystemFont(ofSize: 32)
        element.textColor = AppColors.textColor
        return element
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }

    func setDelegates(with delegate: UICollectionViewDelegate & UICollectionViewDataSource) {
        mainCollectionView.delegate = delegate
        mainCollectionView.dataSource = delegate
    }

    private func setUpViews() {
        addSubview(titleLabel)
        addSubview(mainCollectionView)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            mainCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
