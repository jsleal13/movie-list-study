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
    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.homeCell)
        collectionView.backgroundColor = .yellow

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: false)
        return collectionView
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
        addSubview(mainCollectionView)
    }

    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
