//
//  MovieDetailViewModel.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation
import Combine

class MovieDetailViewModel {
    private let service: MoveDetailService
    @Published var movie: MovieDetailModel?

    init() {
        self.service = MoveDetailServiceImpl()
    }

    func getMovieDetails(with id: Int) {
        Task {
            do {
                movie = try await service.getMovieDetails(with: id)
            } catch {
                print("deu ruim ):")
            }
        }
    }

    func getMovie() -> MovieDetailModel? { movie }
}
