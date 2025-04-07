//
//  HomeViewModel.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 04/04/25.
//

import Foundation
import UIKit
import Combine

class HomeViewModel {
    @Published var movieList: [MovieModel] = []
    private let service: HomeService

    init() {
        self.service = HomeServiceImpl()
    }

    func getTrendingMovies() {
        Task {
            do {
                let successResponse = try await service.getTrendingMovies()
                movieList = successResponse.results
            } catch {
                print("deu ruim ):")
            }
        }
    }

    func getMoviesList() -> [MovieModel] { movieList }

    func getMovie(for index: Int) -> MovieModel {
        movieList[index]
    }

    func getMovieId(for index: Int) -> Int {
        movieList[index].id
    }

    func buildNextViewController(with movieId: Int?) -> UIViewController {
        guard let movieId = movieId else { return ComingSoonViewController()}
        let viewModel = MovieDetailViewModel()
        return MovieDetailViewController(id: movieId, viewModel: viewModel)
    }
}
