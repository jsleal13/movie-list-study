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
    private lazy var searchBox: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private lazy var mainCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
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
}
