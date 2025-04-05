//
//  HomeViewModel.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 04/04/25.
//

import Foundation

class HomeViewModel {
    var movieList: [MovieModel]?
    private let service: HomeService

    init() {
        self.service = HomeServiceImpl()
        getTrendingMovies()
    }

    func getTrendingMovies() {
        Task {
            do {
                let successResponse = try await service.getTrendingMovies()
                movieList = successResponse.results
                print(movieList)
            } catch {
                print("deu ruim ):")
            }
        }
    }
}
