//
//  MovieDetailViewController.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
import Combine

class MovieDetailViewController: BaseViewController {
    private var id: Int
    let mainView = MovieDetailView()
    let viewModel: MovieDetailViewModel
    private var cancellable = Set<AnyCancellable>()

    init(id: Int, viewModel: MovieDetailViewModel) {
        self.id = id
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func loadView() {
        super.loadView()
        view = mainView
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
