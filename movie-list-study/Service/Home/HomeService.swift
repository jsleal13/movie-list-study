//
//  HomeService.swift
//  movie-list-study
//
//  Created by Janine Silva Leal on 05/04/25.
//

import Foundation

protocol HomeService {
    func getTrendingMovies() async throws -> TrendingMovies
}

final class HomeServiceImpl: HomeService {
    private let service = APIClient.shared

    func getTrendingMovies() async throws -> TrendingMovies {
        let request = HomeRequestInfos()
        let response: TrendingMovies = try await service.request(target: request)
        return response
    }
}
