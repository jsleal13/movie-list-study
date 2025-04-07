//
//  MoveDetailService.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 06/04/25.
//

import Foundation

protocol MoveDetailService {
    func getMovieDetails(with movieId: Int) async throws -> MovieDetailModel
}

final class MoveDetailServiceImpl: MoveDetailService {
    private let service = APIClient.shared

    func getMovieDetails(with movieId: Int) async throws -> MovieDetailModel {
        let request = MovieDetailRequestInfos(movieId: movieId)
        let response: MovieDetailModel = try await service.request(target: request)
        return response
    }
}
