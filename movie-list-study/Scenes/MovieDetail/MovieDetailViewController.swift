//
//  MovieDetailViewController.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
import Combine

class MovieDetailViewController: BaseViewController, MovieDetailViewDelegate {
    private var id: Int
    let mainView = MovieDetailView()
    let viewModel: MovieDetailViewModel
    private var cancellable = Set<AnyCancellable>()
    let storage = FavoriteStorage.shared

    init(id: Int, viewModel: MovieDetailViewModel) {
        self.id = id
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = mainView
        mainView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovieDetails(with: id)
        awaitMovieSetting()
    }

    private func awaitMovieSetting() {
        viewModel.$movie.receive(on: DispatchQueue.main).sink { movie in
            self.mainView.configureMovie(with: movie)
        }.store(in: &cancellable)
    }

    func toggleFavorite(movie: MovieDetailModel) {
        storage.addMovieToFavorites(movie: movie)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
