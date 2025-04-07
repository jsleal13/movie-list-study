//
//  HomeViewController.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 04/04/25.
//

import Foundation
import UIKit
import Combine

final class HomeViewController: BaseViewController {
    private var cancellable = Set<AnyCancellable>()
    let mainView = HomeView()
    let viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setDelegates(with: self)
        viewModel.getTrendingMovies()
        refreshMovieList()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func refreshMovieList() {
        viewModel.$movieList.receive(on: DispatchQueue.main).sink { _ in
            self.mainView.mainCollectionView.reloadData()
        }.store(in: &cancellable)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getMoviesList().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.homeCell, for: indexPath) as? HomeCollectionViewCell

        let movie = viewModel.getMovie(for: indexPath.row)
        cell?.setUp(with: movie)

        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movieId = viewModel.getMovieId(for: indexPath.row)
        let viewController = viewModel.buildNextViewController(with: movieId)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
